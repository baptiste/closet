#import "../lib.typ": camera, hand

#set page(width: 18cm, height: 10cm, margin: 8mm)
#set text(font: "New Computer Modern", size: 8pt)

#let view = camera(
  eye: (2.4, -7.0, 3.0),
  target: (0.0, 0.0, 0.65),
  focal-length: 6.5,
)
#let panel(label, render, radius: 0.045) = [
  #box(width: 100%, height: 48mm)[
    #align(center + horizon, hand(
      gesture: "peace",
      render: render,
      tube-radius: radius,
      scale: 2.25,
      camera: view,
    ))
  ]
  #align(center, text(label))
]

#align(center)[
  #text(size: 16pt, weight: "bold")[V hand rendering]
  #v(4mm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14mm,
    panel([Projected skeleton], "skeleton"),
    panel([Volumetric tubes], "tube", radius: 0.05),
  )
]
