import importlib.util
import unittest
from pathlib import Path


ROOT = Path(__file__).parents[1]
SPEC = importlib.util.spec_from_file_location("import_opensim", ROOT / "tools/import_opensim.py")
assert SPEC is not None and SPEC.loader is not None
IMPORTER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(IMPORTER)


class OpenSimImportTest(unittest.TestCase):
    def test_maps_gait_coordinates_to_closet_angles(self) -> None:
        fixture = (ROOT / "tests/fixtures/gait2354-coordinates.osim").read_bytes()

        model, limits = IMPORTER.parse_limits(fixture)

        self.assertEqual(model, "3DGaitModel2354")
        self.assertEqual(set(limits), {"left-leg", "right-leg", "left-knee", "right-knee"})
        self.assertAlmostEqual(limits["left-leg"].minimum, -300.0, places=4)
        self.assertAlmostEqual(limits["left-leg"].maximum, -60.0, places=4)
        self.assertAlmostEqual(limits["right-knee"].minimum, -120.0, places=4)
        self.assertAlmostEqual(limits["right-knee"].maximum, 10.0, places=4)
        self.assertFalse(limits["right-knee"].clamped_in_opensim)

    def test_keeps_hip_and_knee_values_paired_by_motion_frame(self) -> None:
        fixture = (ROOT / "tests/fixtures/walk.mot").read_bytes()

        samples = IMPORTER.parse_motion(fixture)

        self.assertEqual([sample["time"] for sample in samples], [0.0, 1.0])
        self.assertEqual(
            samples[0]["pose_degrees"],
            {"left-leg": -190.0, "left-knee": -5.0, "right-leg": -160.0, "right-knee": -50.0},
        )
        self.assertEqual(samples[1]["source_coordinates"]["knee_angle_l"], -55.0)


if __name__ == "__main__":
    unittest.main()