#import "../lib.typ": camera, hand

#set page(paper: "a4", flipped: true, margin: 10mm)
#set text(font: "New Computer Modern", size: 8pt)

#let view = camera(
  eye: (2.4, -7.0, 3.0),
  target: (0.0, 0.0, 0.65),
  focal-length: 6.5,
)
#let gallery = (
  ("open-palm", [Open palm]),
  ("fist", [Fist]),
  ("pointing", [Pointing]),
  ("peace", [V / peace]),
  ("thumbs-up", [Thumbs-up]),
  ("pinch", [Pinch / OK]),
  ("three-fingers", [Three fingers]),
  ("rock", [Rock]),
  ("beckoning", [Beckoning]),
)

#let tile(name, label) = [
  #box(width: 100%, height: 47mm)[
    #align(center + horizon, hand(gesture: name, scale: 2.25, camera: view))
  ]
  #align(center, text(label))
]

#align(center)[
  #text(size: 16pt, weight: "bold")[Closet hand gestures]
  #v(3mm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12mm,
    row-gutter: 2mm,
    ..gallery.map(entry => tile(entry.at(0), entry.at(1))),
  )
]
