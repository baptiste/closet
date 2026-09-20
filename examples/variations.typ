#import "../lib.typ": human, profile-camera, vary-pose

#set page(width: 18cm, height: 7cm, margin: 8mm)
#set text(font: "New Computer Modern", size: 8pt)

#let figures = range(5).map(seed => (
  pose: vary-pose("walking", variation: 0.09, seed: seed),
  seed: seed,
))

#grid(
  columns: (1fr,) * figures.len(),
  gutter: 3mm,
  align: center + bottom,
  ..figures.map(figure => [
    #box(width: 100%, height: 40mm)[
      #align(center + horizon, human(pose: figure.pose, scale: 0.95, camera: profile-camera))
    ]
    #align(center, text([seed #figure.seed]))
  ]),
)