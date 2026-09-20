#import "../lib.typ" as closet

#set page(width: 18cm, height: 7.2cm, margin: 8mm)
#set text(font: "New Computer Modern", size: 8pt)

#let pose = closet.poses.sitting-cross-legged
#let views = (
  ("front", closet.camera(eye: (0.0, -8.0, 2.4))),
  ("three-quarter", closet.camera(eye: (5.0, -7.0, 3.0))),
  ("side", closet.camera(eye: (8.0, 0.0, 2.4))),
)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8mm,
  align: center + bottom,
  ..views.map(view => [
    #box(width: 100%, height: 42mm)[
      #align(center + horizon, closet.human(pose: pose, scale: 1.2, camera: view.at(1)))
    ]
    #align(center, text(view.at(0)))
  ]),
)