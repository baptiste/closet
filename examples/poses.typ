#import "../lib.typ": front-camera, human, profile-camera

#set page(paper: "a4", flipped: true, margin: 10mm)
#set text(font: "New Computer Modern", size: 8pt)

#let gallery = (
  ("sitting", "sitting"),
  ("sitting-cross-legged", "sitting cross-legged"),
  ("sitting-thinking", "sitting, thinking"),
  ("walking", "walking"),
  ("running", "running"),
  ("yoga-downward-dog", "downward dog"),
  ("yoga-child-pose", "child's pose"),
  ("yoga-warrior-two", "warrior two"),
  ("yoga-tree", "tree pose"),
  ("squatting", "squatting"),
  ("push-up", "push-up"),
  ("pull-up", "pull-up"),
  ("jumping-open-legs", "jumping, open legs"),
)

#let profile-poses = (
  "sitting",
  "sitting-thinking",
  "walking",
  "running",
  "yoga-downward-dog",
  "yoga-child-pose",
  "push-up",
)

#let tile(name, label) = box(width: 100%, height: 39mm)[
  #let view = if name in profile-poses {
    profile-camera
  } else {
    front-camera
  }
  #align(center + bottom, box(height: 31mm)[
    #align(center + horizon, human(pose: name, scale: 0.9, camera: view))
  ])
  #align(center, text(label))
]

#align(center)[
  #text(size: 16pt, weight: "bold")[Closet pose library]
  #v(3mm)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 5mm,
    row-gutter: 1mm,
    ..gallery.map(entry => tile(entry.at(0), entry.at(1))),
  )
]