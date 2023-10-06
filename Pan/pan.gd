class_name Pan
extends CharacterBody2D

var spinning = false
var av = 0
var ANG_SPEED = PI * -6 # 1 rot per 0.25 seconds
var ANG_ACCEL = PI * -16 # 1 rot per 0.25 seconds

func _ready():
	collision_layer = 0

func _process(delta):
	if spinning:
		av += ANG_ACCEL * delta
		av = ANG_SPEED if av < ANG_SPEED else av
		rotation += delta * av

	if rotation <= PI * -2:
		spinning = false
		av = 0
		rotation = 0
		collision_layer = 0
		
	if Input.is_action_just_pressed("ui_down") and not spinning:
		spinning = true
		collision_layer = 2
		
	visible = spinning

func register_hit(segment: Node2D):
	spinning = false
	av = 0
	rotation = 0
	collision_layer = 0
