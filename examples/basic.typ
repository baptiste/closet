#import "../lib.typ": human

#set page(width: 13cm, height: 8cm, margin: 10mm)
#set text(font: "New Computer Modern", size: 9pt)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    rows: (4cm, auto),
    gutter: 16mm,
    align: center + bottom,
    human(pose: "standing", scale: 1.2),
    human(pose: "running", scale: 1.2),
    [standing],
    [running],
  )
]