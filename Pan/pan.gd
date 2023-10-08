class_name Pan
extends CharacterBody2D

@export var ANG_SPEED = PI * -6
@export var ANG_ACCEL = PI * -16
@export var COOL_DOWN: float = 1.0

var spinning = false
var av = 0
var current_cool_down: float = 0.0

func _ready():
	collision_layer = 0

func _process(delta):
	if spinning:
		av += ANG_ACCEL * delta
		av = ANG_SPEED if av < ANG_SPEED else av
		rotation += delta * av

	current_cool_down -= delta
	if current_cool_down < 0:
		current_cool_down = 0

	if rotation <= PI * -2:
		spinning = false
		av = 0
		rotation = 0
		collision_layer = 0
		
	if Input.is_action_just_pressed("ui_down") and current_cool_down <= 0.0:
		spinning = true
		collision_layer = 2
		current_cool_down = COOL_DOWN
		
	visible = spinning

func register_hit(_segment: Node2D):
	collision_layer = 0
