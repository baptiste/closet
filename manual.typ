#import "lib.typ" as closet

#set document(title: "Closet Manual", author: "Baptiste Auguie")
#set page(paper: "a4", margin: (x: 23mm, y: 20mm), numbering: "1")
#set text(font: "New Computer Modern", size: 10pt, fill: rgb("24211d"))
#set par(justify: true, leading: 0.72em)
#set heading(numbering: "1.")
#show link: set text(fill: rgb("315f72"))
#show raw.where(block: true): body => block(
  inset: 8pt,
  fill: rgb("f5f0e8"),
  stroke: rgb("c9bda9"),
  radius: 2pt,
  body,
)

#let caption(body) = align(center, text(size: 8.5pt, style: "italic", body))
#let pose-panel(title, view, pose: "sitting-cross-legged", scale: 1.0) = [
  #box(width: 100%, height: 43mm)[
    #align(center + horizon, closet.human(pose: pose, scale: scale, camera: view))
  ]
  #caption(title)
]

#align(center)[
  #v(26mm)
  #text(size: 31pt, weight: "bold", smallcaps[Closet])
  #v(3mm)
  #text(size: 13pt, style: "italic")[Three-dimensional articulated figures for Typst]
  #v(17mm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 7mm,
    align: center,
    closet.human(pose: "walking", scale: 1.25, camera: closet.profile-camera),
    closet.human(pose: "yoga-tree", scale: 1.25, camera: closet.front-camera),
    closet.human(pose: "yoga-downward-dog", scale: 1.15, camera: closet.profile-camera),
  )
  #v(18mm)
  #text(size: 11pt)[Version 0.1.0]
]

#pagebreak()
#outline(title: [Contents], indent: auto)

#pagebreak()
= Overview

Closet draws compact human figures from an articulated model. A pose contains
three-dimensional bone directions. The package evaluates those directions into
joint positions, projects the joints through a perspective camera, and sends
the resulting paths to Premetadated's calligraphic pen engine.

The pipeline is:

```text
3D pose directions
  -> 3D forward kinematics
  -> perspective camera
  -> 2D projected paths
  -> calligraphic nib envelopes
  -> CeTZ vector output
```

This separation is important. Changing the camera does not alter the body or
its pose; it only changes how the same 3D joints appear on the page.

== Installation

For local package use, install both repositories under Typst's local package
directory:

```text
{data-dir}/typst/packages/local/closet/0.1.0
{data-dir}/typst/packages/local/premetadated/0.1.0
```

On macOS, `{data-dir}` is `~/Library/Application Support`. Import the package as:

```typ
#import "@local/closet:0.1.0": human
```

From this repository, examples can instead use `#import "lib.typ"`.

== First figure

```typ
#import "@local/closet:0.1.0": human

#human(pose: "running", scale: 1.2)
```

`human` returns a CeTZ canvas, so it can be placed in normal Typst grids,
figures, boxes, and alignment containers.

= Three-dimensional model

Closet uses right-handed `(x, y, z)` coordinates:

- `x` runs horizontally across a front-facing body;
- `y` carries depth, toward or away from the viewer;
- `z` points upward.

A canonical pose stores `torso` and `side` directions plus one direction for
each upper and lower arm and leg. Directions need not be unit length; the
kinematics normalizes them before applying fixed anatomical segment lengths.

```typ
#let custom = (
  torso: (0.0, 0.0, 1.0),
  side: (1.0, 0.0, 0.0),
  left-upper-arm: (0.7, 0.2, 0.7),
  left-lower-arm: (0.8, 0.1, 0.5),
  right-upper-arm: (-0.2, -0.8, -0.6),
  right-lower-arm: (-0.1, -0.9, -0.4),
  left-upper-leg: (0.2, 0.0, -1.0),
  left-lower-leg: (0.0, 0.0, -1.0),
  right-upper-leg: (-0.2, 0.0, -1.0),
  right-lower-leg: (0.0, 0.0, -1.0),
)

#human(pose: custom)
```

`joints(pose)` evaluates a pose without drawing it. It returns `pelvis`, `neck`,
and `head` points plus three-point chains for each arm and leg. Every returned
point is a 3D tuple.

== Built-in poses

The package includes standing, sitting, cross-legged sitting, thinking,
walking, running, downward dog, child's pose, warrior one, warrior two, tree
pose, squatting, push-up, pull-up, walking on hands, jumping on one foot, and
jumping with open legs. Their stable names are available as keys in `poses`;
see `assets/previews/poses.png` for the visual index.

== Controlled variation

`vary-pose(pose, variation:, seed:)` adds small deterministic offsets to the
canonical 3D bone directions. It accepts either a built-in pose name or a pose
dictionary and returns a new dictionary suitable for `human`, `joints`, or
additional editing.

```typ
#let people = range(5).map(seed =>
  vary-pose("walking", variation: 0.09, seed: seed)
)

#for person in people {
  human(pose: person, camera: profile-camera)
}
```

The same operation is available directly on `human`:

```typ
#human(pose: "walking", variation: 0.09, seed: 3)
```

The integer seed makes output reproducible. Equal inputs produce identical
figures, while different seeds redistribute each limb slightly. Variation is
bounded to `0..0.35`; `0` returns the canonical pose, and `0.04..0.12` usually
gives useful scene diversity without changing the gesture. Torso and body-side
axes receive a smaller perturbation than limbs. All directions are normalized
after perturbation, so bone lengths remain fixed.

= Camera and projection

Create a perspective camera with:

```typ
#let view = camera(
  eye: (3.8, -8.0, 2.8),
  target: (0.0, 0.0, 0.2),
  up: (0.0, 0.0, 1.0),
  focal-length: 7.0,
)
```

`eye` is the camera position. `target` is the world-space point at the center of
the image. `up` establishes image vertical. `focal-length` controls perspective
magnification: increasing it enlarges the projected figure when camera distance
is unchanged.

The implementation constructs a look-at basis from these values. For point
$p$, eye $e$, forward vector $f$, camera-right vector $r$, and camera-up vector
$u$, depth is $d = (p-e) dot f$. Projection is proportional to
$((p-e) dot r / d, (p-e) dot u / d)$. Points must remain in front of the camera.

== One pose, three views

The following three figures all use exactly `poses.sitting-cross-legged`. Only
the camera position changes.

#let shared-pose = closet.poses.sitting-cross-legged
#let front = closet.camera(
  eye: (0.0, -8.0, 2.4),
  target: (0.0, 0.0, 0.2),
  focal-length: 7.0,
)
#let three-quarter = closet.camera(
  eye: (5.0, -7.0, 3.0),
  target: (0.0, 0.0, 0.2),
  focal-length: 7.0,
)
#let side = closet.camera(
  eye: (8.0, 0.0, 2.4),
  target: (0.0, 0.0, 0.2),
  focal-length: 7.0,
)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 7mm,
  pose-panel([Front], front, pose: shared-pose, scale: 1.15),
  pose-panel([Three-quarter], three-quarter, pose: shared-pose, scale: 1.15),
  pose-panel([Side], side, pose: shared-pose, scale: 1.15),
)

The front view emphasizes bilateral symmetry. The three-quarter view reveals
which knees and hands advance in depth. The side view compresses the body's
width but exposes front-to-back placement. This is why a pose that looks
ambiguous from one direction can become immediately legible from another.

```typ
#let pose = poses.sitting-cross-legged

#human(pose: pose, camera: camera(eye: (0, -8, 2.4)))
#human(pose: pose, camera: camera(eye: (5, -7, 3.0)))
#human(pose: pose, camera: camera(eye: (8, 0, 2.4)))
```

== Choosing a useful viewpoint

Use a front view for poses whose defining feature is left-right symmetry, such
as warrior two, tree pose, squatting, and jumping. Use a profile view for poses
whose silhouette depends on forward motion or floor contact, such as sitting,
walking, running, downward dog, child's pose, and push-up. A three-quarter view
is useful when depth relationships matter but both sides must remain visible.

The supplied `front-camera`, `profile-camera`, and `three-quarter-camera` are
convenient defaults, not semantic constraints. A pose may face another world
direction, and a custom `camera` can always be more informative.

== Framing and focal length

Move `eye` and `target` to frame the subject. Keep `target` near the torso for
upright poses and lower it for floor poses. If the figure is too small, increase
`focal-length`, increase `human(scale:)`, or move the eye closer. Changing focal
length alters perspective and magnification; changing `scale` only changes the
final drawing size and pen dimensions.

= Calligraphic rendering

Every bone and the head outline are rendered by
`premetadated.stroke.nib-stroke`. The default tangent-following nib has a broad
axis of `0.050`, a fine axis of `0.015`, and an offset of `24deg`. Nib dimensions
scale with the figure.

Pass any Premetadated pen dictionary to override it:

```typ
#human(
  pose: "yoga-warrior-two",
  pen: (
    mode: "calligraphic",
    offset: 12deg,
    samples: ((arclength: 0, a: 0.055, b: 0.009),),
  ),
  stroke: rgb("352b25"),
)
```

Larger separation between `a` and `b` creates stronger contrast between broad
and fine directions. The nib offset rotates that contrast relative to each
path's tangent.

= Imported OpenSim motion

`tools/import_opensim.py` is an offline adapter. It downloads pinned Gait2354
model and inverse-kinematics data, then writes compact model ranges and paired
gait frames to `data/gait2354.json`.

```sh
python3 tools/import_opensim.py
typst compile --root . examples/opensim.typ build/opensim.pdf
```

`pose-from-degrees(base, values)` converts imported sagittal hip and knee angles
into 3D leg directions. Use a canonical 3D pose as the upper-body base:

```typ
#let data = json("data/gait2354.json")
#let sample = data.samples.first()
#let pose = pose-from-degrees(poses.walking, sample.pose_degrees)
#human(pose: pose, limits: data.limits, camera: profile-camera)
```

The synchronized hip and knee values belong to one observed time step. Joint
ranges alone do not guarantee a realistic combined pose, and the Gait2354
ranges are model domains rather than universal physiological safety limits.

= API reference

== `human`

`human(pose:, variation:, seed:, scale:, stroke:, pen:, limits:, camera:)`
renders one figure.
`pose` accepts a built-in name or complete 3D pose dictionary. `stroke` is the
ink color. `pen` accepts a Premetadated pen; `none` selects the package default.
`limits` optionally clamps imported OpenSim leg angles. `camera` controls the
projection.

== `vary-pose`

`vary-pose(pose, variation:, seed:)` returns a reproducibly perturbed 3D pose.
The accepted variation range is `0..0.35` and the seed must be an integer.

== `camera`

`camera(eye:, target:, up:, focal-length:)` validates and returns a camera
dictionary. The package exports `default-camera`, `front-camera`,
`profile-camera`, and `three-quarter-camera`.

== `project`

`project(point, camera:)` maps one 3D point to a 2D pair. It is useful when
labels or other graphics must align with a figure joint.

== `joints`

`joints(pose)` evaluates forward kinematics and returns the 3D body landmarks
without rendering.

== `pose-from-degrees` and `constrain-pose`

These helpers bridge compact OpenSim-derived data to the 3D renderer. They are
primarily intended for generated sagittal gait samples.

= Troubleshooting

- *Package not found:* install both `closet:0.1.0` and
  `premetadated:0.1.0` in the same local package namespace.
- *A pose looks flat:* move the camera away from a principal axis, for example
  from `(0, -8, 2.4)` to `(4, -7, 3)`.
- *A limb is hidden:* rotate the camera around `target`; do not modify the pose
  merely to compensate for one viewpoint.
- *The figure is clipped:* move `eye` farther away or reduce `scale`.
- *Projection reports a point behind the camera:* move `eye` away from the
  model and keep `target` between the camera and figure.
- *Calligraphy is too subtle:* increase nib axis `a` or reduce `b`.