extends Node2D

@onready var stump := $Stump
@onready var trunk: Array[RigidBody2D] = [
	$TrunkSegment01/Trunk01,
	$TrunkSegment02/Trunk02,
	$TrunkSegment03/Trunk03
	]
var hit := [false, false, false]

func _physics_process(_delta):
	if hit[0]:
		trunk[0].apply_central_impulse(Vector2(600 * _delta,0))
	if hit[1]:
		trunk[1].apply_central_impulse(Vector2(600 * _delta,0))
	if hit[2]:
		trunk[2].apply_central_impulse(Vector2(600 * _delta,0))

func _on_trunk_area_01_body_entered(body):
	hit[0] = true

func _on_trunk_area_02_body_entered(body):
	hit[1] = true

func _on_trunk_area_03_body_entered(body):
	hit[2] = true
