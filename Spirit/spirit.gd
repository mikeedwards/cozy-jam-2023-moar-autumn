class_name Spirit
extends CharacterBody2D

@export var SPEED_X: float = 18000.0
@export var JUMP_IMPULSE: float = 36000.0
@export var GRAVITY: float = 10.0
@export var IMPULSE_LIMIT: float = 0.25
var impulse_timer = 0

func _physics_process(delta):
	var impulse = JUMP_IMPULSE
	if position.y <= 0:
		impulse = 0
	if impulse_timer > 0:
		impulse = 0

	var vx: Vector2 = SPEED_X * delta * Vector2.RIGHT
	var vy: Vector2 = (velocity.y + GRAVITY) * Vector2.DOWN

	if Input.is_action_just_pressed("ui_accept"):
		vy += Vector2.UP * impulse * delta
		impulse_timer = IMPULSE_LIMIT

	impulse_timer -= delta

	velocity = vx + vy
		
	move_and_slide()
