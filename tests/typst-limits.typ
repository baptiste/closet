#import "../lib.typ": constrain-pose, joints, pose-from-degrees, poses, project

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
	"yoga-warrior-two",
	"yoga-tree",
	"squatting",
	"push-up",
	"pull-up",
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
#let projected-target = project((0.0, 0.0, 0.2))
#assert(calc.abs(projected-target.at(0)) < 0.00001)
#assert(calc.abs(projected-target.at(1)) < 0.00001)