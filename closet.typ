#import "@preview/cetz:0.4.2"
#import "@local/premetadated:0.1.0" as premetadated

#let pen-stroke = premetadated.stroke

#let _pose(
  torso: (0.0, 0.0, 1.0),
  side: (1.0, 0.0, 0.0),
  head: none,
  left-upper-arm: (0.1, 0.0, -1.0),
  left-lower-arm: (0.0, 0.0, -1.0),
  right-upper-arm: (-0.1, 0.0, -1.0),
  right-lower-arm: (0.0, 0.0, -1.0),
  left-upper-leg: (0.1, 0.0, -1.0),
  left-lower-leg: (0.0, 0.0, -1.0),
  right-upper-leg: (-0.1, 0.0, -1.0),
  right-lower-leg: (0.0, 0.0, -1.0),
) = (
  torso: torso,
  side: side,
  head: head,
  left-upper-arm: left-upper-arm,
  left-lower-arm: left-lower-arm,
  right-upper-arm: right-upper-arm,
  right-lower-arm: right-lower-arm,
  left-upper-leg: left-upper-leg,
  left-lower-leg: left-lower-leg,
  right-upper-leg: right-upper-leg,
  right-lower-leg: right-lower-leg,
)

#let pose = _pose

#let poses = (
  standing: _pose(),
  sitting: _pose(
     side: (0.0, 1.0, 0.0),
     left-upper-arm: (0.25, 0.05, -0.97),
     left-lower-arm: (0.45, 0.03, -0.9),
     right-upper-arm: (0.25, -0.05, -0.97),
     right-lower-arm: (0.45, -0.03, -0.9),
     left-upper-leg: (1.0, 0.05, -0.12),
    left-lower-leg: (0.0, 0.0, -1.0),
     right-upper-leg: (1.0, -0.05, -0.12),
    right-lower-leg: (0.0, 0.0, -1.0),
  ),
  sitting-cross-legged: _pose(
    left-upper-arm: (0.4, -0.15, -0.9),
    left-lower-arm: (0.35, -0.2, -0.5),
    right-upper-arm: (-0.4, -0.15, -0.9),
    right-lower-arm: (-0.35, -0.2, -0.5),
    left-upper-leg: (0.85, -0.35, -0.4),
    left-lower-leg: (-0.9, -0.25, -0.2),
    right-upper-leg: (-0.85, -0.35, -0.4),
    right-lower-leg: (0.9, -0.25, -0.2),
  ),
  sitting-thinking: _pose(
    torso: (0.35, 0.0, 0.94),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (0.25, 0.05, -0.97),
    left-lower-arm: (0.55, 0.03, -0.84),
    right-upper-arm: (0.4, -0.05, -0.3),
    right-lower-arm: (-0.5, 0.4, 0.85),
    left-upper-leg: (1.0, 0.05, -0.12),
    left-lower-leg: (0.0, 0.0, -1.0),
    right-upper-leg: (1.0, -0.05, -0.12),
    right-lower-leg: (0.0, 0.0, -1.0),
  ),
  walking: _pose(
    torso: (0.1, 0.0, 1.0),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (-0.55, 0.05, -0.85),
    left-lower-arm: (-0.35, 0.0, -0.95),
    right-upper-arm: (0.55, -0.05, -0.85),
    right-lower-arm: (0.35, 0.0, -0.95),
    left-upper-leg: (0.45, 0.05, -0.9),
    left-lower-leg: (0.15, 0.0, -1.0),
    right-upper-leg: (-0.45, -0.05, -0.9),
    right-lower-leg: (-0.15, 0.0, -1.0),
  ),
  running: _pose(
    torso: (0.22, 0.0, 0.98),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (-0.65, 0.05, -0.75),
    left-lower-arm: (0.65, 0.0, -0.75),
    right-upper-arm: (0.65, -0.05, -0.75),
    right-lower-arm: (-0.65, 0.0, -0.75),
    left-upper-leg: (0.72, 0.05, -0.7),
    left-lower-leg: (0.35, 0.0, -0.94),
    right-upper-leg: (-0.72, -0.05, -0.7),
    right-lower-leg: (0.7, 0.0, -0.72),
  ),
  yoga-downward-dog: _pose(
    torso: (0.75, 0.0, -0.66),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (0.55, 0.04, -0.84),
    left-lower-arm: (0.55, 0.02, -0.84),
    right-upper-arm: (0.55, -0.04, -0.84),
    right-lower-arm: (0.55, -0.02, -0.84),
    left-upper-leg: (-0.35, 0.04, -0.94),
    left-lower-leg: (-0.15, 0.02, -0.99),
    right-upper-leg: (-0.35, -0.04, -0.94),
    right-lower-leg: (-0.15, -0.02, -0.99),
  ),
  yoga-child-pose: _pose(
    torso: (0.88, 0.0, -0.48),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (0.85, 0.04, -0.52),
    left-lower-arm: (0.95, 0.02, -0.3),
    right-upper-arm: (0.85, -0.04, -0.52),
    right-lower-arm: (0.95, -0.02, -0.3),
    left-upper-leg: (0.78, 0.04, -0.62),
    left-lower-leg: (-0.85, 0.02, -0.52),
    right-upper-leg: (0.78, -0.04, -0.62),
    right-lower-leg: (-0.85, -0.02, -0.52),
  ),
  yoga-warrior-two: _pose(
    left-upper-arm: (1.0, 0.0, 0.0),
    left-lower-arm: (1.0, 0.0, 0.0),
    right-upper-arm: (-1.0, 0.0, 0.0),
    right-lower-arm: (-1.0, 0.0, 0.0),
    left-upper-leg: (0.8, 0.0, -0.6),
    left-lower-leg: (0.0, 0.0, -1.0),
    right-upper-leg: (-0.7, 0.0, -0.72),
    right-lower-leg: (-0.7, 0.0, -0.72),
  ),
  yoga-warrior-one: _pose(
    torso: (0.08, 0.0, 1.0),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (0.28, 0.08, 0.96),
    left-lower-arm: (0.2, 0.04, 0.98),
    right-upper-arm: (0.28, -0.08, 0.96),
    right-lower-arm: (0.2, -0.04, 0.98),
    left-upper-leg: (0.75, 0.05, -0.66),
    left-lower-leg: (0.0, 0.02, -1.0),
    right-upper-leg: (-0.62, -0.05, -0.78),
    right-lower-leg: (-0.62, -0.03, -0.78),
  ),
  yoga-tree: _pose(
    left-upper-arm: (0.55, 0.0, 0.84),
    left-lower-arm: (-0.55, 0.0, 0.84),
    right-upper-arm: (-0.55, 0.0, 0.84),
    right-lower-arm: (0.55, 0.0, 0.84),
    left-upper-leg: (0.05, 0.0, -1.0),
    left-lower-leg: (0.0, 0.0, -1.0),
    right-upper-leg: (-0.6, -0.05, -0.8),
    right-lower-leg: (0.95, 0.0, 0.3),
  ),
  squatting: _pose(
    torso: (0.0, -0.22, 0.98),
    left-upper-arm: (0.25, -0.65, -0.72),
    left-lower-arm: (0.45, -0.6, -0.65),
    right-upper-arm: (-0.25, -0.65, -0.72),
    right-lower-arm: (-0.45, -0.6, -0.65),
    left-upper-leg: (0.72, -0.2, -0.66),
    left-lower-leg: (-0.12, -0.08, -0.99),
    right-upper-leg: (-0.72, -0.2, -0.66),
    right-lower-leg: (0.12, -0.08, -0.99),
  ),
  push-up: _pose(
    torso: (1.0, 0.0, 0.08),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (-0.8, 0.05, -0.6),
    left-lower-arm: (0.8, 0.02, -0.6),
    right-upper-arm: (-0.8, -0.05, -0.6),
    right-lower-arm: (0.8, -0.02, -0.6),
    left-upper-leg: (-0.9, 0.03, -0.44),
    left-lower-leg: (-0.9, 0.02, -0.44),
    right-upper-leg: (-0.9, -0.03, -0.44),
    right-lower-leg: (-0.9, -0.02, -0.44),
  ),
  pull-up: _pose(
    left-upper-arm: (0.65, 0.0, 0.76),
    left-lower-arm: (-0.2, 0.0, 0.98),
    right-upper-arm: (-0.65, 0.0, 0.76),
    right-lower-arm: (0.2, 0.0, 0.98),
    left-upper-leg: (0.2, 0.0, -0.98),
    left-lower-leg: (-0.2, 0.0, -0.98),
    right-upper-leg: (-0.2, 0.0, -0.98),
    right-lower-leg: (0.2, 0.0, -0.98),
  ),
  walking-on-hands: _pose(
    torso: (0.12, 0.0, -0.99),
    side: (0.0, 1.0, 0.0),
    left-upper-arm: (0.22, 0.05, -0.98),
    left-lower-arm: (-0.08, 0.02, -1.0),
    right-upper-arm: (-0.18, -0.05, -0.98),
    right-lower-arm: (0.12, -0.02, -0.99),
    left-upper-leg: (-0.42, 0.05, 0.91),
    left-lower-leg: (-0.72, 0.03, 0.69),
    right-upper-leg: (0.52, -0.05, 0.85),
    right-lower-leg: (0.82, -0.03, 0.57),
  ),
  jumping-one-foot: _pose(
    torso: (0.08, 0.0, 1.0),
    left-upper-arm: (0.65, 0.0, 0.76),
    left-lower-arm: (0.35, 0.0, 0.94),
    right-upper-arm: (-0.55, 0.0, 0.84),
    right-lower-arm: (-0.25, 0.0, 0.97),
    left-upper-leg: (0.08, 0.0, -1.0),
    left-lower-leg: (-0.05, 0.0, -1.0),
    right-upper-leg: (-0.78, -0.08, -0.62),
    right-lower-leg: (0.75, -0.04, 0.66),
  ),
  jumping-open-legs: _pose(
    left-upper-arm: (0.55, 0.0, 0.84),
    left-lower-arm: (0.55, 0.0, 0.84),
    right-upper-arm: (-0.55, 0.0, 0.84),
    right-lower-arm: (-0.55, 0.0, 0.84),
    left-upper-leg: (0.65, 0.0, -0.76),
    left-lower-leg: (0.65, 0.0, -0.76),
    right-upper-leg: (-0.65, 0.0, -0.76),
    right-lower-leg: (-0.65, 0.0, -0.76),
  ),
)

#let _add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1), a.at(2) + b.at(2))
#let _sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1), a.at(2) - b.at(2))
#let _mul(vector, amount) = (vector.at(0) * amount, vector.at(1) * amount, vector.at(2) * amount)
#let _dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)
#let _cross(a, b) = (
  a.at(1) * b.at(2) - a.at(2) * b.at(1),
  a.at(2) * b.at(0) - a.at(0) * b.at(2),
  a.at(0) * b.at(1) - a.at(1) * b.at(0),
)
#let _unit(vector) = {
  let length = calc.sqrt(_dot(vector, vector))
  assert(length > 0, message: "bone and camera vectors must be non-zero")
  _mul(vector, 1 / length)
}
#let _step(origin, length, direction) = _add(origin, _mul(_unit(direction), length))

#let _resolve-pose(pose) = {
  if type(pose) == str {
    assert(pose in poses, message: "unknown closet pose: " + pose)
    poses.at(pose)
  } else {
    assert(type(pose) == dictionary, message: "pose must be a name or dictionary")
    pose
  }
}

#let _noise(seed, index) = calc.sin((seed * 91.7 + index * 47.3 + 13.1) * 1rad)

#let vary-pose(pose, variation: 0.08, seed: 0) = {
  assert(type(seed) == int, message: "pose variation seed must be an integer")
  assert(variation >= 0 and variation <= 0.35, message: "pose variation must be between 0 and 0.35")
  let varied = _resolve-pose(pose)
  if variation == 0 {
    return varied
  }
  let names = (
    "torso", "side",
    "left-upper-arm", "left-lower-arm", "right-upper-arm", "right-lower-arm",
    "left-upper-leg", "left-lower-leg", "right-upper-leg", "right-lower-leg",
  )
  for (index, name) in names.enumerate() {
    let direction = varied.at(name)
    let amount = if name == "torso" or name == "side" { variation * 0.45 } else { variation }
    let offset = (
      _noise(seed, index * 3),
      _noise(seed, index * 3 + 1),
      _noise(seed, index * 3 + 2),
    )
    varied.insert(name, _unit(_add(direction, _mul(offset, amount))))
  }
  varied
}

#let _gesture-amount(amount, name, signed: false) = {
  let valid = if signed { calc.abs(amount) <= 1 } else { amount >= 0 and amount <= 1 }
  assert(valid, message: name + " amount must be " + if signed { "between -1 and 1" } else { "between 0 and 1" })
  amount
}

#let _gesture-sides(side) = {
  assert(side in ("left", "right", "both"), message: "gesture side must be left, right, or both")
  if side == "both" { ("left", "right") } else { (side,) }
}

#let _blend-direction(from, to, amount) = _unit(_add(_mul(_unit(from), 1 - amount), _mul(_unit(to), amount)))

#let tilt-head(pose, amount: 0.25) = {
  let amount = _gesture-amount(amount, "tilt-head", signed: true)
  let modified = _resolve-pose(pose)
  modified.insert("head", _unit(_add(_unit(modified.torso), _mul(_unit(modified.side), amount))))
  modified
}

#let bend-torso(pose, amount: 0.2) = {
  let amount = _gesture-amount(amount, "bend-torso", signed: true)
  let modified = _resolve-pose(pose)
  let torso = _unit(modified.torso)
  let forward = _unit(_cross(_unit(modified.side), torso))
  modified.insert("torso", _unit(_add(torso, _mul(forward, amount))))
  modified
}

#let raise-arms(pose, amount: 0.75, side: "both") = {
  let amount = _gesture-amount(amount, "raise-arms")
  let modified = _resolve-pose(pose)
  let torso = _unit(modified.torso)
  let lateral = _unit(modified.side)
  for body-side in _gesture-sides(side) {
    let sign = if body-side == "left" { 1 } else { -1 }
    let target = _unit(_add(torso, _mul(lateral, sign * 0.18)))
    for segment in ("upper-arm", "lower-arm") {
      let name = body-side + "-" + segment
      modified.insert(name, _blend-direction(modified.at(name), target, amount))
    }
  }
  modified
}

#let stretch-arms(pose, amount: 0.8, side: "both") = {
  let amount = _gesture-amount(amount, "stretch-arms")
  let modified = _resolve-pose(pose)
  for body-side in _gesture-sides(side) {
    let upper = modified.at(body-side + "-upper-arm")
    let lower-name = body-side + "-lower-arm"
    modified.insert(lower-name, _blend-direction(modified.at(lower-name), upper, amount))
  }
  modified
}

#let spread-legs(pose, amount: 0.65) = {
  let amount = _gesture-amount(amount, "spread-legs")
  let modified = _resolve-pose(pose)
  let torso = _unit(modified.torso)
  let lateral = _unit(modified.side)
  for body-side in ("left", "right") {
    let sign = if body-side == "left" { 1 } else { -1 }
    let target = _unit(_add(_mul(lateral, sign), _mul(torso, -0.8)))
    for segment in ("upper-leg", "lower-leg") {
      let name = body-side + "-" + segment
      modified.insert(name, _blend-direction(modified.at(name), target, amount))
    }
  }
  modified
}

#let walk-legs(pose, amount: 0.55) = {
  let amount = _gesture-amount(amount, "walk-legs", signed: true)
  let modified = _resolve-pose(pose)
  let torso = _unit(modified.torso)
  let forward = _unit(_cross(_unit(modified.side), torso))
  for (body-side, sign) in (("left", 1), ("right", -1)) {
    let upper-name = body-side + "-upper-leg"
    let lower-name = body-side + "-lower-leg"
    let upper-target = _unit(_add(_mul(torso, -1), _mul(forward, amount * sign)))
    let lower-target = _unit(_add(_mul(torso, -1), _mul(forward, amount * sign * 0.2)))
    modified.insert(upper-name, _blend-direction(modified.at(upper-name), upper-target, calc.abs(amount)))
    modified.insert(lower-name, _blend-direction(modified.at(lower-name), lower-target, calc.abs(amount)))
  }
  modified
}

#let wave-arms(pose, amount: 0.8, side: "right") = {
  let amount = _gesture-amount(amount, "wave-arms")
  let modified = _resolve-pose(pose)
  let torso = _unit(modified.torso)
  let lateral = _unit(modified.side)
  for body-side in _gesture-sides(side) {
    let sign = if body-side == "left" { 1 } else { -1 }
    let upper-target = _unit(_add(_mul(torso, 0.7), _mul(lateral, sign * 0.75)))
    let lower-target = _unit(_add(_mul(torso, 0.95), _mul(lateral, sign * -0.3)))
    let upper-name = body-side + "-upper-arm"
    let lower-name = body-side + "-lower-arm"
    modified.insert(upper-name, _blend-direction(modified.at(upper-name), upper-target, amount))
    modified.insert(lower-name, _blend-direction(modified.at(lower-name), lower-target, amount))
  }
  modified
}

#let _chain(origin, lengths, directions) = {
  let points = (origin,)
  let point = origin
  for (length, direction) in lengths.zip(directions) {
    point = _step(point, length, direction)
    points.push(point)
  }
  points
}

#let joints(pose) = {
  let pelvis = (0.0, 0.0, 0.0)
  let torso = _unit(pose.torso)
  let side = _unit(pose.side)
  let neck = _step(pelvis, 1.15, torso)
  let left-shoulder = _step(neck, 0.36, side)
  let right-shoulder = _step(neck, -0.36, side)
  let left-hip = _step(pelvis, 0.18, side)
  let right-hip = _step(pelvis, -0.18, side)
  let head-direction = if "head" in pose and pose.head != none { pose.head } else { torso }

  (
    pelvis: pelvis,
    neck: neck,
    head: _step(neck, 0.42, head-direction),
    left-arm: _chain(left-shoulder, (0.72, 0.62), (pose.left-upper-arm, pose.left-lower-arm)),
    right-arm: _chain(right-shoulder, (0.72, 0.62), (pose.right-upper-arm, pose.right-lower-arm)),
    left-leg: _chain(left-hip, (0.92, 0.88), (pose.left-upper-leg, pose.left-lower-leg)),
    right-leg: _chain(right-hip, (0.92, 0.88), (pose.right-upper-leg, pose.right-lower-leg)),
  )
}

#let camera(
  eye: (3.8, -8.0, 2.8),
  target: (0.0, 0.0, 0.2),
  up: (0.0, 0.0, 1.0),
  focal-length: 7.0,
) = {
  assert(focal-length > 0, message: "camera focal length must be positive")
  (eye: eye, target: target, up: up, focal-length: focal-length)
}

#let front-camera = camera(eye: (0.0, -8.0, 2.4))
#let profile-camera = camera(eye: (0.8, -8.0, 2.4))
#let three-quarter-camera = camera()
#let default-camera = three-quarter-camera

#let project(point, camera: default-camera) = {
  let forward = _unit(_sub(camera.target, camera.eye))
  let right = _unit(_cross(forward, camera.up))
  let vertical = _cross(right, forward)
  let relative = _sub(point, camera.eye)
  let depth = _dot(relative, forward)
  assert(depth > 0.01, message: "skeleton point is behind the camera")
  (
    _dot(relative, right) * camera.focal-length / depth,
    _dot(relative, vertical) * camera.focal-length / depth,
  )
}

#let _legacy-leg-angle(pose, side) = {
  let name = side + "-leg"
  if name in pose { pose.at(name) } else { -180deg }
}

#let _apply-leg-degrees(pose) = {
  let converted = pose
  for side in ("left", "right") {
    let hip = _legacy-leg-angle(converted, side)
    let knee-name = side + "-knee"
    let knee = if knee-name in converted { converted.at(knee-name) } else { 0deg }
    converted.insert(side + "-upper-leg", (calc.cos(90deg + hip), 0.0, calc.sin(90deg + hip)))
    converted.insert(side + "-lower-leg", (calc.cos(90deg + hip + knee), 0.0, calc.sin(90deg + hip + knee)))
  }
  converted
}

#let constrain-pose(pose, limits) = {
  let constrained = pose
  for name in ("left-leg", "left-knee", "right-leg", "right-knee") {
    if name in limits and name in constrained {
      let limit = limits.at(name)
      let degrees = constrained.at(name) / 1deg
      constrained.insert(name, calc.min(calc.max(degrees, limit.minimum), limit.maximum) * 1deg)
    }
  }
  _apply-leg-degrees(constrained)
}

#let pose-from-degrees(base, values) = {
  let pose = base
  for (name, value) in values.pairs() {
    pose.insert(name, value * 1deg)
  }
  _apply-leg-degrees(pose)
}

#let human(
  pose: "standing",
  variation: 0.0,
  seed: 0,
  scale: 1.0,
  stroke: black,
  pen: none,
  limits: none,
  camera: default-camera,
) = {
  let selected = _resolve-pose(pose)
  if limits != none {
    selected = constrain-pose(selected, limits)
  }
  selected = vary-pose(selected, variation: variation, seed: seed)
  assert(scale > 0, message: "skeleton scale must be positive")
  let model = joints(selected)
  let transform(point) = {
    let projected = project(point, camera: camera)
    (projected.at(0) * scale, projected.at(1) * scale)
  }
  let selected-pen = if pen == none {
    (
      mode: "calligraphic",
      offset: 24deg,
      samples: ((arclength: 0, a: 0.050 * scale, b: 0.015 * scale),),
    )
  } else {
    pen
  }
  let draw-chain(points) = pen-stroke.nib-polylines(
    (points.map(transform),),
    pen: selected-pen,
    epsilon: 0.003,
    fill: stroke,
  )

  cetz.canvas(length: 1cm, {
    draw-chain((model.pelvis, model.neck))
    draw-chain((model.left-arm.first(), model.right-arm.first()))
    draw-chain((model.left-leg.first(), model.right-leg.first()))
    draw-chain(model.left-arm)
    draw-chain(model.right-arm)
    draw-chain(model.left-leg)
    draw-chain(model.right-leg)
    let head = transform(model.head)
    let neck = transform(model.neck)
    let radius = 0.27 * scale * calc.sqrt(
      calc.pow(head.at(0) - neck.at(0), 2) + calc.pow(head.at(1) - neck.at(1), 2)
    ) / 0.42
    let head-outline = range(32).map(index => {
      let angle = index / 32 * 2 * calc.pi
      (head.at(0) + radius * calc.cos(angle), head.at(1) + radius * calc.sin(angle))
    })
    pen-stroke.nib-stroke(
      pen-stroke.polyline-path(head-outline),
      pen: selected-pen,
      closed: true,
      epsilon: 0.003,
      fill: stroke,
    )
  })
}