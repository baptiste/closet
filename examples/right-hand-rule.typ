#import "../lib.typ": camera, hand

#set page(width: 10cm, height: 10cm, margin: 8mm)
#set text(font: "New Computer Modern", size: 8pt)

#let view = camera(
  eye: (3.6, -7.0, 3.0),
  target: (0.0, 0.0, 0.65),
  focal-length: 6.5,
)

#align(center)[
  #text(size: 15pt, weight: "bold")[Right-hand coordinate rule]
  #v(5mm)
  #box(width: 100%, height: 58mm)[
    #align(center + horizon, hand(
      gesture: "right-hand-rule",
      axes: true,
      finger-hatch-count: 1,
      scale: 2.2,
      camera: view,
    ))
  ]
  #text(style: "italic")[Thumb: x · index: y · middle: z]
]
