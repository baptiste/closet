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

#let _clamp(value, minimum, maximum) = calc.min(calc.max(value, minimum), maximum)

#let _hand-finger(parameters, name, thumb: false) = {
  assert(type(parameters) == dictionary, message: name + " parameters must be a dictionary")
  let curl = parameters.at("curl", default: 0.0)
  let spread = parameters.at("spread", default: 0.0)
  assert(curl >= 0 and curl <= 1, message: name + " curl must be between 0 and 1")
  assert(spread >= -1 and spread <= 1, message: name + " spread must be between -1 and 1")
  let result = (curl: curl, spread: spread)
  if thumb {
    let opposition = parameters.at("opposition", default: 0.15)
    assert(opposition >= 0 and opposition <= 1, message: "thumb opposition must be between 0 and 1")
    result.insert("opposition", opposition)
  }
  result
}

#let hand-pose(
  thumb: (curl: 0.0, spread: 0.25, opposition: 0.15),
  index: (curl: 0.0, spread: 0.0),
  middle: (curl: 0.0, spread: 0.0),
  ring: (curl: 0.0, spread: 0.0),
  pinky: (curl: 0.0, spread: 0.0),
  spread: 1.0,
  wrist: (pitch: 0deg, yaw: 0deg, roll: 0deg),
) = {
  assert(spread >= 0 and spread <= 1.5, message: "hand spread must be between 0 and 1.5")
  assert(type(wrist) == dictionary, message: "wrist orientation must be a dictionary")
  for name in ("pitch", "yaw", "roll") {
    assert(type(wrist.at(name, default: 0deg)) == angle, message: "wrist " + name + " must be an angle")
  }
  assert(calc.abs(wrist.at("pitch", default: 0deg)) <= 45deg, message: "wrist pitch must be between -45deg and 45deg")
  assert(calc.abs(wrist.at("yaw", default: 0deg)) <= 45deg, message: "wrist yaw must be between -45deg and 45deg")
  assert(calc.abs(wrist.at("roll", default: 0deg)) <= 90deg, message: "wrist roll must be between -90deg and 90deg")
  (
    thumb: _hand-finger(thumb, "thumb", thumb: true),
    index: _hand-finger(index, "index"),
    middle: _hand-finger(middle, "middle"),
    ring: _hand-finger(ring, "ring"),
    pinky: _hand-finger(pinky, "pinky"),
    spread: spread,
    wrist: (
      pitch: wrist.at("pitch", default: 0deg),
      yaw: wrist.at("yaw", default: 0deg),
      roll: wrist.at("roll", default: 0deg),
    ),
  )
}

#let _open-hand = hand-pose()
#let _fist-hand = hand-pose(
  thumb: (curl: 0.72, spread: 0.05, opposition: 0.78),
  index: (curl: 0.96),
  middle: (curl: 1.0),
  ring: (curl: 1.0),
  pinky: (curl: 0.94),
  spread: 0.15,
)
#let _pointing-hand = hand-pose(
  thumb: (curl: 0.58, spread: 0.05, opposition: 0.72),
  index: (curl: 0.02),
  middle: (curl: 0.98),
  ring: (curl: 1.0),
  pinky: (curl: 0.94),
  spread: 0.25,
)
#let _peace-hand = hand-pose(
  thumb: (curl: 0.62, spread: 0.0, opposition: 0.72),
  index: (curl: 0.02, spread: -0.35),
  middle: (curl: 0.02, spread: 0.35),
  ring: (curl: 0.98),
  pinky: (curl: 0.94),
  spread: 0.55,
)
#let _thumbs-up-hand = hand-pose(
  thumb: (curl: 0.02, spread: -1.0, opposition: 0.0),
  index: (curl: 0.96),
  middle: (curl: 1.0),
  ring: (curl: 1.0),
  pinky: (curl: 0.94),
  spread: 0.1,
)
#let _pinch-hand = hand-pose(
  thumb: (curl: 0.42, spread: -0.1, opposition: 1.0),
  index: (curl: 0.48, spread: -0.15),
  middle: (curl: 0.08, spread: 0.1),
  ring: (curl: 0.12, spread: 0.18),
  pinky: (curl: 0.18, spread: 0.25),
  spread: 0.7,
)
#let _three-fingers-hand = hand-pose(
  thumb: (curl: 0.65, spread: 0.0, opposition: 0.72),
  index: (curl: 0.02, spread: -0.22),
  middle: (curl: 0.02),
  ring: (curl: 0.03, spread: 0.22),
  pinky: (curl: 0.94),
  spread: 0.65,
)
#let _rock-hand = hand-pose(
  thumb: (curl: 0.62, spread: 0.0, opposition: 0.7),
  index: (curl: 0.02, spread: -0.2),
  middle: (curl: 1.0),
  ring: (curl: 1.0),
  pinky: (curl: 0.02, spread: 0.35),
  spread: 0.72,
)
#let _beckoning-hand = hand-pose(
  thumb: (curl: 0.5, spread: 0.1, opposition: 0.62),
  index: (curl: 0.48, spread: -0.12),
  middle: (curl: 0.9),
  ring: (curl: 0.96),
  pinky: (curl: 0.9),
  spread: 0.35,
  wrist: (pitch: -6deg, yaw: 0deg, roll: 0deg),
)
#let _right-hand-rule-hand = hand-pose(
  thumb: (curl: 0.02, spread: 1.0, opposition: 0.0),
  index: (curl: 0.02, spread: -0.08),
  middle: (curl: 0.35, spread: 0.08),
  ring: (curl: 0.96),
  pinky: (curl: 0.92),
  spread: 0.35,
)

#let hand-gestures = (
  open-palm: _open-hand,
  fist: _fist-hand,
  pointing: _pointing-hand,
  peace: _peace-hand,
  thumbs-up: _thumbs-up-hand,
  pinch: _pinch-hand,
  ok: _pinch-hand,
  three-fingers: _three-fingers-hand,
  rock: _rock-hand,
  beckoning: _beckoning-hand,
  right-hand-rule: _right-hand-rule-hand,
)

#let hand-topology = (
  ("wrist", "thumb-cmc", "thumb-mcp", "thumb-ip", "thumb-tip"),
  ("wrist", "index-mcp", "index-pip", "index-dip", "index-tip"),
  ("wrist", "middle-mcp", "middle-pip", "middle-dip", "middle-tip"),
  ("wrist", "ring-mcp", "ring-pip", "ring-dip", "ring-tip"),
  ("wrist", "pinky-mcp", "pinky-pip", "pinky-dip", "pinky-tip"),
)

#let hand-joint-limits = (
  finger-mcp: (minimum: 0deg, maximum: 70deg),
  finger-pip: (minimum: 0deg, maximum: 95deg),
  finger-dip: (minimum: 0deg, maximum: 65deg),
  thumb-cmc: (minimum: 0deg, maximum: 40deg),
  thumb-mcp: (minimum: 0deg, maximum: 55deg),
  thumb-ip: (minimum: 0deg, maximum: 60deg),
  wrist-pitch: (minimum: -45deg, maximum: 45deg),
  wrist-yaw: (minimum: -45deg, maximum: 45deg),
  wrist-roll: (minimum: -90deg, maximum: 90deg),
)

#let _resolve-hand(gesture) = {
  if type(gesture) == str {
    assert(gesture in hand-gestures, message: "unknown hand gesture: " + gesture)
    hand-gestures.at(gesture)
  } else {
    assert(type(gesture) == dictionary, message: "hand gesture must be a name or hand-pose dictionary")
    gesture
  }
}

#let vary-hand(gesture, variation: 0.08, seed: 0) = {
  assert(type(seed) == int, message: "hand variation seed must be an integer")
  assert(variation >= 0 and variation <= 0.25, message: "hand variation must be between 0 and 0.25")
  let varied = _resolve-hand(gesture)
  if variation == 0 {
    return varied
  }
  for (index, name) in ("thumb", "index", "middle", "ring", "pinky").enumerate() {
    let finger = varied.at(name)
    let shared = _noise(seed + 101, index * 3) * variation
    finger.insert("curl", _clamp(finger.curl + shared, 0.0, 1.0))
    finger.insert("spread", _clamp(finger.spread + _noise(seed + 101, index * 3 + 1) * variation * 0.55, -1.0, 1.0))
    if name == "thumb" {
      finger.insert("opposition", _clamp(finger.opposition + _noise(seed + 101, index * 3 + 2) * variation * 0.45, 0.0, 1.0))
    }
    varied.insert(name, finger)
  }
  let wrist = varied.wrist
  wrist.insert("pitch", _clamp(wrist.pitch + _noise(seed + 101, 20) * variation * 9deg, -45deg, 45deg))
  wrist.insert("yaw", _clamp(wrist.yaw + _noise(seed + 101, 21) * variation * 9deg, -45deg, 45deg))
  wrist.insert("roll", _clamp(wrist.roll + _noise(seed + 101, 22) * variation * 9deg, -90deg, 90deg))
  varied.insert("wrist", wrist)
  varied
}

#let hand-angles(gesture, variation: 0.0, seed: 0) = {
  let selected = vary-hand(gesture, variation: variation, seed: seed)
  let result = (
    wrist: selected.wrist,
    spread: selected.spread,
  )
  for name in ("index", "middle", "ring", "pinky") {
    let finger = selected.at(name)
    result.insert(name, (
      mcp: finger.curl * hand-joint-limits.finger-mcp.maximum,
      pip: finger.curl * hand-joint-limits.finger-pip.maximum,
      dip: finger.curl * hand-joint-limits.finger-dip.maximum,
      spread: finger.spread,
    ))
  }
  let thumb = selected.thumb
  result.insert("thumb", (
    cmc: thumb.curl * hand-joint-limits.thumb-cmc.maximum,
    mcp: thumb.curl * hand-joint-limits.thumb-mcp.maximum,
    ip: thumb.curl * hand-joint-limits.thumb-ip.maximum,
    spread: thumb.spread,
    opposition: thumb.opposition,
  ))
  result
}

#let _rotate-x(point, angle) = (
  point.at(0),
  point.at(1) * calc.cos(angle) - point.at(2) * calc.sin(angle),
  point.at(1) * calc.sin(angle) + point.at(2) * calc.cos(angle),
)
#let _rotate-y(point, angle) = (
  point.at(0) * calc.cos(angle) + point.at(2) * calc.sin(angle),
  point.at(1),
  -point.at(0) * calc.sin(angle) + point.at(2) * calc.cos(angle),
)
#let _rotate-z(point, angle) = (
  point.at(0) * calc.cos(angle) - point.at(1) * calc.sin(angle),
  point.at(0) * calc.sin(angle) + point.at(1) * calc.cos(angle),
  point.at(2),
)

#let _orient-hand-point(point, wrist, handedness) = {
  let oriented = if handedness == "right" { (-point.at(0), point.at(1), point.at(2)) } else { point }
  oriented = _rotate-x(oriented, wrist.pitch)
  oriented = _rotate-y(oriented, wrist.yaw)
  _rotate-z(oriented, wrist.roll)
}

#let _finger-chain(base, lengths, angles, spread) = {
  let directions = ()
  let flexion = 0deg
  for angle in angles {
    flexion += angle
    directions.push(_unit((
      calc.sin(spread) * calc.cos(flexion),
      -calc.sin(flexion),
      calc.cos(spread) * calc.cos(flexion),
    )))
  }
  _chain(base, lengths, directions)
}

#let hand-joints(gesture, variation: 0.0, seed: 0, handedness: "right") = {
  assert(handedness in ("right", "left"), message: "handedness must be right or left")
  let angles = hand-angles(gesture, variation: variation, seed: seed)
  let wrist = (0.0, 0.0, 0.0)
  let finger-data = (
    index: (base: (-0.28, 0.0, 0.61), lengths: (0.43, 0.27, 0.20), spread: -8deg),
    middle: (base: (-0.09, 0.0, 0.67), lengths: (0.47, 0.30, 0.22), spread: -2deg),
    ring: (base: (0.12, 0.0, 0.64), lengths: (0.44, 0.28, 0.21), spread: 5deg),
    pinky: (base: (0.31, 0.0, 0.55), lengths: (0.34, 0.22, 0.17), spread: 13deg),
  )
  let local = (wrist: wrist)
  for name in ("index", "middle", "ring", "pinky") {
    let anatomy = finger-data.at(name)
    let finger = angles.at(name)
    let spread = anatomy.spread * angles.spread + finger.spread * 12deg
    let chain = _finger-chain(
      anatomy.base,
      anatomy.lengths,
      (finger.mcp, finger.pip, finger.dip),
      spread,
    )
    for (joint, point) in ("mcp", "pip", "dip", "tip").zip(chain) {
      local.insert(name + "-" + joint, point)
    }
  }
  let thumb = angles.thumb
  let thumb-cmc = (-0.42, -0.02, 0.25)
  let thumb-spread = 45deg + thumb.spread * 32deg
  let thumb-flexions = (thumb.cmc, thumb.cmc + thumb.mcp, thumb.cmc + thumb.mcp + thumb.ip)
  let thumb-lengths = (0.34, 0.28, 0.23)
  let thumb-points = (thumb-cmc,)
  let thumb-point = thumb-cmc
  let index-target = local.at("index-tip")
  for (index, pair) in thumb-lengths.zip(thumb-flexions).enumerate() {
    let (length, flexion) = pair
    let natural = _unit((
      -calc.sin(thumb-spread) * calc.cos(flexion),
      -calc.sin(flexion + thumb.opposition * 22deg),
      calc.cos(thumb-spread) * calc.cos(flexion),
    ))
    let toward-index = _unit(_sub(index-target, thumb-point))
    let opposition = thumb.opposition * (0.35 + index * 0.25)
    thumb-point = _step(thumb-point, length, _blend-direction(natural, toward-index, _clamp(opposition, 0.0, 1.0)))
    thumb-points.push(thumb-point)
  }
  for (joint, point) in ("cmc", "mcp", "ip", "tip").zip(thumb-points) {
    local.insert("thumb-" + joint, point)
  }
  local.map(point => _orient-hand-point(point, angles.wrist, handedness))
}

#let right-hand-rule-axes(handedness: "right") = {
  let landmarks = hand-joints("right-hand-rule", handedness: handedness)
  let origin = _add(landmarks.wrist, _mul(_sub(landmarks.middle-mcp, landmarks.wrist), 0.5))
  let x-direction = _unit(_sub(landmarks.thumb-tip, landmarks.thumb-cmc))
  let y-direction = _unit(_sub(landmarks.index-tip, landmarks.index-mcp))
  let z-direction = _unit(_sub(landmarks.middle-tip, landmarks.middle-mcp))
  (
    origin: origin,
    x: x-direction,
    y: y-direction,
    z: z-direction,
  )
}

#let hand(
  gesture: "open-palm",
  variation: 0.0,
  seed: 0,
  handedness: "right",
  render: "tube",
  tube-radius: 0.045,
  tube-sides: 10,
  shading: true,
  finger-hatch-count: 2,
  axes: false,
  scale: 2.0,
  stroke: black,
  pen: none,
  camera: default-camera,
) = {
  assert(scale > 0, message: "hand scale must be positive")
  assert(render in ("skeleton", "tube"), message: "hand render must be skeleton or tube")
  assert(tube-radius > 0, message: "hand tube radius must be positive")
  assert(type(tube-sides) == int and tube-sides >= 6, message: "hand tube sides must be an integer of at least 6")
  assert(type(shading) == bool, message: "hand shading must be boolean")
  assert(type(finger-hatch-count) == int and finger-hatch-count >= 0, message: "finger hatch count must be a non-negative integer")
  assert(type(axes) == bool, message: "hand axes must be boolean")
  assert(not axes or gesture == "right-hand-rule", message: "hand axes require the right-hand-rule gesture")
  assert(not axes or handedness == "right", message: "right-hand-rule axes require handedness right")
  let landmarks = hand-joints(
    gesture,
    variation: variation,
    seed: seed,
    handedness: handedness,
  )
  let transform(point) = {
    let projected = project(point, camera: camera)
    (projected.at(0) * scale, projected.at(1) * scale)
  }
  let selected-pen = if pen == none {
    (
      mode: "calligraphic",
      offset: 24deg,
      samples: ((arclength: 0, a: 0.025 * scale, b: 0.008 * scale),),
    )
  } else {
    pen
  }
  if render == "tube" {
    let geometry = premetadated.geometry
    let tube-pen = if pen == none {
      (0.012 * scale, 0.0035 * scale, 24deg)
    } else {
      pen
    }
    let light = (-1.0, -0.5, 1.0)
    let finger-pattern = if shading and finger-hatch-count > 0 {
      (geometry.texture.lit-hatch)(light: light, count: finger-hatch-count, length: 0.045, crosshatch: 0.0)
    } else {
      (geometry.texture.outline)()
    }
    let palm-pattern = if shading {
      (geometry.texture.lit-hatch)(light: light, count: 18, length: 0.06, crosshatch: 0.0)
    } else {
      (geometry.texture.outline)()
    }
    let radius-profiles = (
      (1.12, 1.02),
      (1.02, 0.9),
      (0.9, 0.72),
    )
    let finger-shapes = ()
    for chain in hand-topology {
      for (segment-index, pair) in chain.slice(1).windows(2).enumerate() {
        finger-shapes.push(geometry.tube(
          pair.map(name => landmarks.at(name)),
          radius: radius-profiles.at(segment-index).map(factor => tube-radius * factor),
          sides: tube-sides,
          cap: "round",
          pattern: finger-pattern,
        ))
      }
    }
    let joint-shapes = hand-topology.map(chain => chain.slice(1, 3).map(name => geometry.sphere(
      landmarks.at(name),
      tube-radius * 1.12,
      pattern: (geometry.texture.outline)(),
    ))).flatten()
    let palm-anchors = ("thumb-cmc", "index-mcp", "middle-mcp", "ring-mcp", "pinky-mcp")
    let palm-shapes = palm-anchors.map(name => geometry.tube(
      (landmarks.wrist, landmarks.at(name)),
      radius: tube-radius * 1.45,
      sides: tube-sides,
      pattern: finger-pattern,
    ))
    let palm-center = _add(landmarks.wrist, _mul(_sub(landmarks.middle-mcp, landmarks.wrist), 0.52))
    let palm-volume = geometry.ellipsoid(
      palm-center,
      (0.39, 0.11, 0.34),
      pattern: palm-pattern,
    )
    let shapes = finger-shapes + joint-shapes + palm-shapes + (palm-volume,)
    let viewport-height = 4.0
    let fovy = 2 * calc.atan(viewport-height / (2 * camera.focal-length * scale)) / 1deg
    return cetz.canvas(length: 1cm, {
      geometry.render(
        ..shapes,
        eye: camera.eye,
        center: camera.target,
        up: camera.up,
        width: 4.2,
        height: viewport-height,
        fovy: fovy,
        step: 0.015,
        pen: tube-pen,
        epsilon: 0.002,
        fill: stroke,
      )
      if axes {
        let basis = right-hand-rule-axes(handedness: handedness)
        let axis-data = (
          (name: "x", direction: basis.x, color: rgb("b33a3a")),
          (name: "y", direction: basis.y, color: rgb("2f6f48")),
          (name: "z", direction: basis.z, color: rgb("315f8a")),
        )
        for axis in axis-data {
          let tip = _add(basis.origin, _mul(axis.direction, 1.25))
          let cone-base = _add(basis.origin, _mul(axis.direction, 1.08))
          geometry.render(
            geometry.cylinder(0.014, basis.origin, cone-base),
            geometry.cone(0.055, cone-base, tip),
            eye: camera.eye,
            center: camera.target,
            up: camera.up,
            width: 4.2,
            height: viewport-height,
            fovy: fovy,
            step: 0.015,
            pen: (0.009 * scale, 0.0028 * scale, 24deg),
            epsilon: 0.002,
            fill: axis.color,
          )
          let label-point = transform(_add(tip, _mul(axis.direction, 0.08)))
          cetz.draw.content(
            (label-point.at(0) + 2.1, label-point.at(1) + viewport-height / 2),
            text(size: 8pt, weight: "bold", fill: axis.color, axis.name),
            padding: 0pt,
          )
        }
      }
    })
  }
  cetz.canvas(length: 1cm, {
    for chain in hand-topology {
      pen-stroke.nib-polylines(
        (chain.map(name => transform(landmarks.at(name))),),
        pen: selected-pen,
        epsilon: 0.002,
        fill: stroke,
      )
    }
    let palm-outline = ("thumb-cmc", "index-mcp", "middle-mcp", "ring-mcp", "pinky-mcp", "wrist")
    pen-stroke.nib-stroke(
      pen-stroke.polyline-path(palm-outline.map(name => transform(landmarks.at(name)))),
      pen: selected-pen,
      closed: true,
      epsilon: 0.002,
      fill: stroke,
    )
  })
}