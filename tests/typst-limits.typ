#import "../lib.typ": constrain-pose, joints, pose-from-degrees, poses, project, vary-pose

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