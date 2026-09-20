#import "@local/closet:0.1.0": camera, human, poses, vary-pose

#assert("yoga-tree" in poses)
#assert("yoga-warrior-one" in poses)
#assert("walking-on-hands" in poses)
#assert("jumping-one-foot" in poses)
#assert.eq(vary-pose("walking", seed: 4), vary-pose("walking", seed: 4))
#human(
	pose: "yoga-tree",
	camera: camera(eye: (2.0, -7.0, 2.5), focal-length: 6.0),
	pen: (
		mode: "calligraphic",
		offset: 18deg,
		samples: ((arclength: 0, a: 0.045, b: 0.009),),
	),
)