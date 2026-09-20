#import "../lib.typ": bend-torso, constrain-pose, hand-angles, hand-gestures, hand-joint-limits, hand-joints, hand-pose, hand-topology, joints, pose, pose-from-degrees, poses, project, raise-arms, right-hand-rule-axes, spread-legs, stretch-arms, tilt-head, vary-hand, vary-pose, walk-legs, wave-arms

#let limits = json("../data/gait2354.json").limits
#let outside = poses.running
#outside.insert("left-leg", -400deg)
#outside.insert("left-knee", 40deg)
#outside.insert("right-leg", -20deg)
#outside.insert("right-knee", -140deg)

#let constrained = constrain-pose(outside, limits)
#assert.eq(constrained.left-leg, -300deg)
#assert.eq(constrained.left-knee, 10deg)
#assert.eq(constrained.right-leg, -60deg)
#assert.eq(constrained.right-knee, -120deg)

#let observed = pose-from-degrees(poses.standing, (left-leg: -160.0, left-knee: -12.5))
#assert.eq(observed.left-leg, -160deg)
#assert.eq(observed.left-knee, -12.5deg)

#let requested-poses = (
	"sitting",
	"sitting-cross-legged",
	"sitting-thinking",
	"running",
	"walking",
	"yoga-downward-dog",
	"yoga-child-pose",
	"yoga-warrior-one",
	"yoga-warrior-two",
	"yoga-tree",
	"squatting",
	"push-up",
	"pull-up",
	"walking-on-hands",
	"jumping-one-foot",
	"jumping-open-legs",
)
#for name in requested-poses {
	assert(name in poses, message: "missing canonical pose: " + name)
	assert.eq(joints(poses.at(name)).pelvis.len(), 3)
}

#let distance(a, b) = calc.sqrt(
	calc.pow(a.at(0) - b.at(0), 2)
	+ calc.pow(a.at(1) - b.at(1), 2)
	+ calc.pow(a.at(2) - b.at(2), 2)
)
#let unit(vector) = {
	let length = calc.sqrt(vector.fold(0.0, (sum, value) => sum + value * value))
	vector.map(value => value / length)
}
#let dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)
#let cross(a, b) = (
	a.at(1) * b.at(2) - a.at(2) * b.at(1),
	a.at(2) * b.at(0) - a.at(0) * b.at(2),
	a.at(0) * b.at(1) - a.at(1) * b.at(0),
)
#let sitting = joints(poses.sitting)
#assert(sitting.left-leg.at(1).at(0) > 0.8)
#assert(sitting.right-leg.at(1).at(0) > 0.8)
#let cross-legged = joints(poses.sitting-cross-legged)
#assert(cross-legged.left-arm.last().at(0) > 0)
#assert(cross-legged.right-arm.last().at(0) < 0)
#let thinking = joints(poses.sitting-thinking)
#assert(thinking.neck.at(0) > thinking.pelvis.at(0))
#assert(distance(thinking.right-arm.last(), thinking.head) < 0.45)
#let downward-dog = joints(poses.yoga-downward-dog)
#assert(downward-dog.neck.at(2) < downward-dog.pelvis.at(2))
#assert(calc.abs(downward-dog.left-arm.last().at(2) - downward-dog.left-leg.last().at(2)) < 0.2)
#let child-pose = joints(poses.yoga-child-pose)
#assert(child-pose.neck.at(2) < child-pose.pelvis.at(2))
#assert(calc.abs(child-pose.left-arm.last().at(2) - child-pose.left-leg.last().at(2)) < 0.15)
#let tree = joints(poses.yoga-tree)
#assert(calc.abs(tree.right-leg.last().at(0) - 0.2) < 0.15)
#assert(tree.right-leg.at(1).at(0) < -0.6)
#let squat = joints(poses.squatting)
#assert(squat.left-leg.at(1).at(0) > 0.7)
#assert(squat.right-leg.at(1).at(0) < -0.7)
#let push-up = joints(poses.push-up)
#assert(calc.abs(push-up.left-arm.last().at(2) - push-up.left-leg.last().at(2)) < 0.15)
#let hand-walk = joints(poses.walking-on-hands)
#assert(hand-walk.neck.at(2) < hand-walk.pelvis.at(2))
#assert(hand-walk.left-arm.last().at(2) < hand-walk.head.at(2))
#assert(hand-walk.right-arm.last().at(2) < hand-walk.head.at(2))
#assert(hand-walk.left-leg.last().at(2) > hand-walk.pelvis.at(2))
#assert(hand-walk.right-leg.last().at(2) > hand-walk.pelvis.at(2))
#let one-foot-jump = joints(poses.jumping-one-foot)
#assert(one-foot-jump.left-leg.last().at(2) < -1.7)
#assert(one-foot-jump.right-leg.at(1).at(0) < -0.6)
#assert(one-foot-jump.right-leg.last().at(2) > one-foot-jump.right-leg.at(1).at(2))
#let projected-target = project((0.0, 0.0, 0.2))
#assert(calc.abs(projected-target.at(0)) < 0.00001)
#assert(calc.abs(projected-target.at(1)) < 0.00001)

#assert.eq(vary-pose("walking", variation: 0), poses.walking)
#let variation-a = vary-pose("walking", variation: 0.08, seed: 7)
#let variation-a-again = vary-pose("walking", variation: 0.08, seed: 7)
#let variation-b = vary-pose("walking", variation: 0.08, seed: 8)
#assert.eq(variation-a, variation-a-again)
#assert.ne(variation-a, variation-b)
#assert.ne(variation-a, poses.walking)
#let varied-joints = joints(variation-a)
#assert(calc.abs(distance(varied-joints.left-arm.at(0), varied-joints.left-arm.at(1)) - 0.72) < 0.00001)
#assert(calc.abs(distance(varied-joints.left-arm.at(1), varied-joints.left-arm.at(2)) - 0.62) < 0.00001)

#let manual-pose = pose(left-upper-arm: (1.0, 0.0, 0.0), right-upper-arm: (-1.0, 0.0, 0.0))
#assert.eq(joints(manual-pose).pelvis.len(), 3)
#let tilted = tilt-head("standing", amount: 0.3)
#assert(tilted.head != none)
#assert(tilted.head.at(0) > 0)
#assert.eq(poses.standing.head, none)
#let bent = bend-torso("standing", amount: 0.3)
#assert(bent.torso.at(1) < 0)
#let raised = raise-arms("standing", amount: 1)
#assert(raised.left-upper-arm.at(2) > 0.9)
#assert(raised.right-upper-arm.at(2) > 0.9)
#let stretched = stretch-arms("running", amount: 1, side: "left")
#assert(distance(stretched.left-lower-arm, unit(stretched.left-upper-arm)) < 0.00001)
#let spread = spread-legs("standing", amount: 1)
#assert(spread.left-upper-leg.at(0) > 0)
#assert(spread.right-upper-leg.at(0) < 0)
#let stepped = walk-legs("standing", amount: 0.7)
#assert(stepped.left-upper-leg.at(1) < 0)
#assert(stepped.right-upper-leg.at(1) > 0)
#let waving = wave-arms("standing", amount: 1, side: "right")
#assert(waving.right-upper-arm.at(2) > 0)

#let requested-hand-gestures = (
	"open-palm", "fist", "pointing", "peace", "thumbs-up",
	"pinch", "ok", "three-fingers", "rock", "beckoning", "right-hand-rule",
)
#for name in requested-hand-gestures {
	assert(name in hand-gestures, message: "missing canonical hand gesture: " + name)
	assert.eq(hand-joints(name).len(), 21)
}
#assert.eq(hand-topology.len(), 5)
#let open-hand = hand-joints("open-palm")
#assert(calc.abs(distance(open-hand.index-mcp, open-hand.index-pip) - 0.43) < 0.00001)
#assert(calc.abs(distance(open-hand.index-pip, open-hand.index-dip) - 0.27) < 0.00001)
#assert(calc.abs(distance(open-hand.thumb-ip, open-hand.thumb-tip) - 0.23) < 0.00001)
#let fist-hand = hand-joints("fist")
#let pointing-hand = hand-joints("pointing")
#assert(pointing-hand.index-tip.at(2) > fist-hand.index-tip.at(2) + 0.6)
#let peace-hand = hand-joints("peace")
#assert(peace-hand.index-tip.at(2) > peace-hand.ring-tip.at(2) + 0.5)
#assert(peace-hand.middle-tip.at(2) > peace-hand.pinky-tip.at(2) + 0.5)
#let thumbs-up-hand = hand-joints("thumbs-up")
#assert(thumbs-up-hand.thumb-tip.at(2) > fist-hand.thumb-tip.at(2))
#let pinch-hand = hand-joints("pinch")
#assert(distance(pinch-hand.thumb-tip, pinch-hand.index-tip) < 0.35)
#let left-open-hand = hand-joints("open-palm", handedness: "left")
#assert(calc.abs(left-open-hand.index-tip.at(0) + open-hand.index-tip.at(0)) < 0.00001)
#assert.eq(left-open-hand.index-tip.at(1), open-hand.index-tip.at(1))
#let right-palm-normal = unit(cross(
	(
		open-hand.index-mcp.at(0) - open-hand.wrist.at(0),
		open-hand.index-mcp.at(1) - open-hand.wrist.at(1),
		open-hand.index-mcp.at(2) - open-hand.wrist.at(2),
	),
	(
		open-hand.thumb-cmc.at(0) - open-hand.wrist.at(0),
		open-hand.thumb-cmc.at(1) - open-hand.wrist.at(1),
		open-hand.thumb-cmc.at(2) - open-hand.wrist.at(2),
	),
))
#let left-palm-normal = unit(cross(
	(
		left-open-hand.index-mcp.at(0) - left-open-hand.wrist.at(0),
		left-open-hand.index-mcp.at(1) - left-open-hand.wrist.at(1),
		left-open-hand.index-mcp.at(2) - left-open-hand.wrist.at(2),
	),
	(
		left-open-hand.thumb-cmc.at(0) - left-open-hand.wrist.at(0),
		left-open-hand.thumb-cmc.at(1) - left-open-hand.wrist.at(1),
		left-open-hand.thumb-cmc.at(2) - left-open-hand.wrist.at(2),
	),
))
#assert(right-palm-normal.at(1) > 0)
#assert(left-palm-normal.at(1) < 0)
#let right-rule = right-hand-rule-axes()
#assert(dot(right-rule.z, unit(cross(right-rule.x, right-rule.y))) > 0.45)
#let rule-hand = hand-joints("right-hand-rule")
#let thumb-direction = unit((
	rule-hand.thumb-tip.at(0) - rule-hand.thumb-cmc.at(0),
	rule-hand.thumb-tip.at(1) - rule-hand.thumb-cmc.at(1),
	rule-hand.thumb-tip.at(2) - rule-hand.thumb-cmc.at(2),
))
#let index-direction = unit((
	rule-hand.index-tip.at(0) - rule-hand.index-mcp.at(0),
	rule-hand.index-tip.at(1) - rule-hand.index-mcp.at(1),
	rule-hand.index-tip.at(2) - rule-hand.index-mcp.at(2),
))
#let middle-direction = unit((
	rule-hand.middle-tip.at(0) - rule-hand.middle-mcp.at(0),
	rule-hand.middle-tip.at(1) - rule-hand.middle-mcp.at(1),
	rule-hand.middle-tip.at(2) - rule-hand.middle-mcp.at(2),
))
#assert(dot(right-rule.x, thumb-direction) > 0.999)
#assert(dot(right-rule.y, index-direction) > 0.999)
#assert(dot(right-rule.z, middle-direction) > 0.999)
#let hand-variation-a = vary-hand("open-palm", variation: 0.08, seed: 11)
#let hand-variation-b = vary-hand("open-palm", variation: 0.08, seed: 12)
#assert.eq(hand-variation-a, vary-hand("open-palm", variation: 0.08, seed: 11))
#assert.ne(hand-variation-a, hand-variation-b)
#let varied-hand = hand-joints(hand-variation-a)
#assert(calc.abs(distance(varied-hand.middle-mcp, varied-hand.middle-pip) - 0.47) < 0.00001)
#let varied-angles = hand-angles(hand-variation-a)
#assert(varied-angles.index.mcp >= hand-joint-limits.finger-mcp.minimum)
#assert(varied-angles.index.mcp <= hand-joint-limits.finger-mcp.maximum)
#assert(varied-angles.wrist.pitch >= hand-joint-limits.wrist-pitch.minimum)
#assert(varied-angles.wrist.pitch <= hand-joint-limits.wrist-pitch.maximum)
#let custom-hand = hand-pose(index: (curl: 0.5, spread: -0.2), wrist: (pitch: 5deg))
#assert.eq(hand-joints(custom-hand).len(), 21)