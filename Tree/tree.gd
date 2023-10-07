class_name SmackableTree
extends Node2D

@onready var stump := $Stump
@onready var trunk: Array[RigidBody2D] = [
	$TrunkSegment01/Trunk01,
	$TrunkSegment02/Trunk02,
	$TrunkSegment03/Trunk03
	]
var hit := [false, false, false]
@export var low_trunk_impulse: float = 2000.0
@export var mid_trunk_impulse: float = 7000.0
@export var high_trunk_impulse: float = 12000.0

func _physics_process(_delta):
	if hit[0]:
		trunk[0].apply_central_impulse(Vector2(low_trunk_impulse * _delta,0))
		hit[0] = false
	if hit[1]:
		trunk[1].apply_central_impulse(Vector2(mid_trunk_impulse * _delta,0))
		hit[1] = false
	if hit[2]:
		trunk[2].apply_central_impulse(Vector2(high_trunk_impulse * _delta,0))
		hit[2] = false


func _on_trunk_area_01_body_entered(body: Pan):
	hit[0] = true
	body.register_hit(trunk[0])

func _on_trunk_area_02_body_entered(body: Pan):
	hit[1] = true
	body.register_hit(trunk[1])

func _on_trunk_area_03_body_entered(body: Pan):
	hit[2] = true
	body.register_hit(trunk[2])
