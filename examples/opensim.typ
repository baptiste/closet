#import "../lib.typ" as closet

#let data = json("../data/gait2354.json")
#let walking-base = closet.poses.walking
#let sample-a = data.samples.at(0)
#let sample-b = data.samples.at(1)
#let pose-a = closet.pose-from-degrees(walking-base, sample-a.pose_degrees)
#let pose-b = closet.pose-from-degrees(walking-base, sample-b.pose_degrees)

#set page(width: 13cm, height: 9.5cm, margin: 10mm)
#set text(font: "New Computer Modern", size: 9pt)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    rows: (4.5cm, auto),
    gutter: 16mm,
    align: center + bottom,
    closet.human(pose: pose-a, scale: 1.1, limits: data.limits),
    closet.human(pose: pose-b, scale: 1.1, limits: data.limits),
    [#sample-a.label, #sample-a.time s],
    [#sample-b.label, #sample-b.time s],
  )
]

#v(4mm)
#align(center)[
  #text(size: 7.5pt, fill: rgb("555555"))[
    Paired hip and knee coordinates from #data.model inverse kinematics.
  ]
]