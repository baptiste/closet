#!/usr/bin/env python3

import argparse
import json
import math
import ssl
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import asdict, dataclass
from pathlib import Path
from urllib.parse import urlparse


OPENSIM_REVISION = "d9b05d470b1a481c222372c85b75772faf8f7792"
DEFAULT_MODEL_URL = (
    "https://raw.githubusercontent.com/opensim-org/opensim-models/"
    f"{OPENSIM_REVISION}/Models/Gait2354_Simbody/gait2354_simbody.osim"
)
DEFAULT_MOTION_URL = (
    "https://raw.githubusercontent.com/opensim-org/opensim-models/"
    f"{OPENSIM_REVISION}/Pipelines/Gait2354_Simbody/subject01_walk1_ik.mot"
)

# OpenSim uses zero for a hanging femur. The drawing model uses -180 degrees
# relative to its upward torso, so hip coordinates need a -180 degree offset.
COORDINATE_MAP = {
    "hip_flexion_l": ("left-leg", -180.0),
    "hip_flexion_r": ("right-leg", -180.0),
    "knee_angle_l": ("left-knee", 0.0),
    "knee_angle_r": ("right-knee", 0.0),
}


@dataclass(frozen=True)
class CoordinateRange:
    minimum: float
    maximum: float
    source_coordinate: str
    source_joint: str
    clamped_in_opensim: bool


def _required_text(element: ET.Element, child_name: str) -> str:
    child = element.find(child_name)
    if child is None or child.text is None or not child.text.strip():
        name = element.get("name", "<unnamed>")
        raise ValueError(f"{name} is missing {child_name}")
    return child.text.strip()


def parse_limits(xml_data: bytes) -> tuple[str, dict[str, CoordinateRange]]:
    root = ET.fromstring(xml_data)
    model = root.find("Model")
    if model is None:
        raise ValueError("OpenSimDocument does not contain a Model")

    limits: dict[str, CoordinateRange] = {}
    for joint in model.findall("./JointSet/objects/*"):
        joint_name = joint.get("name", "<unnamed>")
        for coordinate in joint.findall("./coordinates/Coordinate"):
            source_name = coordinate.get("name", "")
            mapping = COORDINATE_MAP.get(source_name)
            if mapping is None:
                continue
            target_name, offset = mapping
            values = [float(value) for value in _required_text(coordinate, "range").split()]
            if len(values) != 2:
                raise ValueError(f"{source_name} range must contain two values")
            minimum, maximum = sorted(math.degrees(value) + offset for value in values)
            clamped = coordinate.findtext("clamped", default="false").strip().lower() == "true"
            limits[target_name] = CoordinateRange(
                minimum=round(minimum, 6),
                maximum=round(maximum, 6),
                source_coordinate=source_name,
                source_joint=joint_name,
                clamped_in_opensim=clamped,
            )

    expected_targets = {target for target, _ in COORDINATE_MAP.values()}
    if missing_targets := sorted(expected_targets - limits.keys()):
        raise ValueError("model is missing mapped coordinates: " + ", ".join(missing_targets))
    return model.get("name", "<unnamed>"), limits


def read_source(source: str) -> bytes:
    if urlparse(source).scheme in ("http", "https"):
        ca_bundle = Path("/etc/ssl/cert.pem")
        context = ssl.create_default_context(cafile=ca_bundle if ca_bundle.exists() else None)
        with urllib.request.urlopen(source, timeout=30, context=context) as response:
            return response.read()
    return Path(source).read_bytes()


def parse_motion(motion_data: bytes) -> list[dict[str, object]]:
    lines = [line.strip() for line in motion_data.decode("utf-8").splitlines()]
    try:
        header_end = lines.index("endheader")
    except ValueError as error:
        raise ValueError("OpenSim motion file is missing endheader") from error

    metadata = {}
    for line in lines[:header_end]:
        if "=" in line:
            key, value = line.split("=", 1)
            metadata[key.strip().lower()] = value.strip()
    if metadata.get("indegrees", "no").lower() != "yes":
        raise ValueError("this minimal importer requires an inDegrees=yes motion file")

    body = [line for line in lines[header_end + 1 :] if line]
    if not body:
        raise ValueError("OpenSim motion file contains no columns")
    columns = body[0].split()
    required = {"time", *COORDINATE_MAP.keys()}
    if missing := sorted(required - set(columns)):
        raise ValueError("motion file is missing columns: " + ", ".join(missing))

    rows = []
    for line in body[1:]:
        values = [float(value) for value in line.split()]
        if len(values) != len(columns):
            raise ValueError("motion row does not match the column count")
        rows.append(dict(zip(columns, values)))
    if not rows:
        raise ValueError("OpenSim motion file contains no samples")

    def hip_separation(row: dict[str, float]) -> float:
        return row["hip_flexion_r"] - row["hip_flexion_l"]

    selected = (
        ("right leg forward", max(rows, key=hip_separation)),
        ("left leg forward", min(rows, key=hip_separation)),
    )
    samples = []
    for label, row in selected:
        samples.append(
            {
                "label": label,
                "time": row["time"],
                "source_coordinates": {name: row[name] for name in COORDINATE_MAP},
                "pose_degrees": {
                    target: round(row[source] + offset, 6)
                    for source, (target, offset) in COORDINATE_MAP.items()
                },
            }
        )
    return samples


def build_document(
    source: str,
    xml_data: bytes,
    motion_source: str,
    motion_data: bytes,
) -> dict[str, object]:
    model_name, limits = parse_limits(xml_data)
    return {
        "model": model_name,
        "source": source,
        "motion_source": motion_source,
        "units": "degrees",
        "note": (
            "OpenSim coordinate ranges are model domains. "
            "clamped_in_opensim records whether the source model enforces each range."
        ),
        "limits": {name: asdict(limit) for name, limit in sorted(limits.items())},
        "samples": parse_motion(motion_data),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description="Extract lower-body coordinates for Closet")
    parser.add_argument("source", nargs="?", default=DEFAULT_MODEL_URL, help="local .osim path or URL")
    parser.add_argument("--motion-source", default=DEFAULT_MOTION_URL, help="local .mot path or URL")
    parser.add_argument("--output", "-o", type=Path, default=Path("data/gait2354.json"))
    args = parser.parse_args()

    document = build_document(
        args.source,
        read_source(args.source),
        args.motion_source,
        read_source(args.motion_source),
    )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(document, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {len(document['limits'])} mapped limits to {args.output}")


if __name__ == "__main__":
    main()