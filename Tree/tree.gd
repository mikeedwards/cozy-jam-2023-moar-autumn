extends Node2D

@onready var stump := $Stump
@onready var trunk: Array[RigidBody2D] = [
	$TrunkSegment01/Trunk01,
	$TrunkSegment02/Trunk02,
	$TrunkSegment03/Trunk03
	]

func _physics_process(_delta):
	var hit := [Input.is_key_pressed(KEY_Q), Input.is_key_pressed(KEY_W), Input.is_key_pressed(KEY_E)]
	if hit[0]:
		trunk[0].apply_central_impulse(Vector2(600 * _delta,0))
	if hit[1]:
		trunk[1].apply_central_impulse(Vector2(600 * _delta,0))
	if hit[2]:
		trunk[2].apply_central_impulse(Vector2(600 * _delta,0))
 
