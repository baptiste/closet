#import "@local/closet:0.1.0": camera, hand, hand-gestures, hand-joints, human, pose, poses, right-hand-rule-axes, tilt-head, vary-hand, vary-pose, wave-arms

#assert("yoga-tree" in poses)
#assert("yoga-warrior-one" in poses)
#assert("walking-on-hands" in poses)
#assert("jumping-one-foot" in poses)
#assert.eq(vary-pose("walking", seed: 4), vary-pose("walking", seed: 4))
#let custom = pose(left-upper-arm: (1.0, 0.0, 0.0))
#assert.eq(custom.left-upper-arm, (1.0, 0.0, 0.0))
#let greeting = tilt-head(wave-arms("standing", amount: 0.8), amount: -0.2)
#assert(greeting.head != none)
#assert.eq(hand-joints("peace").len(), 21)
#assert.eq(vary-hand("pointing", seed: 5), vary-hand("pointing", seed: 5))
#assert.eq(right-hand-rule-axes().x.len(), 3)
#human(
	pose: greeting,
	camera: camera(eye: (2.0, -7.0, 2.5), focal-length: 6.0),
	pen: (
		mode: "calligraphic",
		offset: 18deg,
		samples: ((arclength: 0, a: 0.045, b: 0.009),),
	),
)
#hand(
	gesture: "right-hand-rule",
	axes: true,
	camera: camera(eye: (2.4, -7.0, 3.0), target: (0.0, 0.0, 0.65), focal-length: 6.5),
	finger-hatch-count: 1,
)