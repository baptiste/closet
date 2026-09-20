#import "@local/closet:0.1.0": camera, human, pose, poses, tilt-head, vary-pose, wave-arms

#assert("yoga-tree" in poses)
#assert("yoga-warrior-one" in poses)
#assert("walking-on-hands" in poses)
#assert("jumping-one-foot" in poses)
#assert.eq(vary-pose("walking", seed: 4), vary-pose("walking", seed: 4))
#let custom = pose(left-upper-arm: (1.0, 0.0, 0.0))
#assert.eq(custom.left-upper-arm, (1.0, 0.0, 0.0))
#let greeting = tilt-head(wave-arms("standing", amount: 0.8), amount: -0.2)
#assert(greeting.head != none)
#human(
	pose: greeting,
	camera: camera(eye: (2.0, -7.0, 2.5), focal-length: 6.0),
	pen: (
		mode: "calligraphic",
		offset: 18deg,
		samples: ((arclength: 0, a: 0.045, b: 0.009),),
	),
)