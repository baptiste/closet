#import "../lib.typ": bend-torso, front-camera, human, pose, stretch-arms, tilt-head, walk-legs, wave-arms

#set page(width: 18cm, height: 8cm, margin: 8mm)
#set text(font: "New Computer Modern", size: 8pt)

#let reaching-crouch = pose(
  torso: (0.25, 0.0, 0.97),
  head: (0.1, 0.0, 1.0),
  left-upper-arm: (0.8, 0.1, 0.35),
  left-lower-arm: (0.95, 0.0, 0.1),
  right-upper-arm: (-0.25, -0.1, -0.97),
  right-lower-arm: (-0.5, 0.0, -0.86),
  left-upper-leg: (0.65, 0.0, -0.76),
  left-lower-leg: (-0.2, 0.0, -0.98),
  right-upper-leg: (-0.55, 0.0, -0.84),
  right-lower-leg: (0.15, 0.0, -0.99),
)

#let greeting = tilt-head(
  wave-arms(
    stretch-arms(
      bend-torso(
        walk-legs("standing", amount: 0.45),
        amount: 0.12,
      ),
      amount: 0.5,
      side: "right",
    ),
    amount: 0.85,
    side: "right",
  ),
  amount: -0.18,
)

#let tile(title, figure) = [
  #box(width: 100%, height: 47mm)[
    #align(center + horizon, figure)
  ]
  #align(center, text(title))
]

#align(center)[
  #text(size: 16pt, weight: "bold")[Custom poses and gestures]
  #v(4mm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12mm,
    tile([Manual reaching crouch], human(pose: reaching-crouch, scale: 1.05, camera: front-camera)),
    tile([Composed greeting], human(pose: greeting, scale: 1.05, camera: front-camera)),
  )
]
