class_name Spirit
extends CharacterBody2D

@export var SPEED_X: float = 12000.0
@export var JUMP_IMPULSE: float = 18000.0
@export var GRAVITY: float = 4.0
@export var IMPULSE_LIMIT: float = 0.1

var impulse_timer = 0
var score = 0

@onready var camera = $Camera2D
@onready var sprite = $AnimatedSprite2D
@onready var score_label: Label = $"Camera2D/Control/ScoreLabel"
@onready var audio: AudioStreamPlayer2D = $ImpactAudio

func _ready():
	$AnimatedSprite2D.connect("animation_finished", _play_idle, CONNECT_DEFERRED)
	_play_idle()
	score_label.text = "Score: %d" % score
	
func _play_idle():
	sprite.play("idle")

func _process(_delta):
	camera.position.y = (position.y + get_tree().get_root().size.y * 0.5) * -.2

func _physics_process(delta):
	var impulse = JUMP_IMPULSE
	
	if impulse_timer > 0:
		impulse = 0

	var vx: Vector2 = SPEED_X * delta * Vector2.RIGHT
	var vy: Vector2 = (velocity.y + GRAVITY) * Vector2.DOWN

	if Input.is_key_pressed(KEY_SPACE):
		vy += Vector2.UP * impulse * delta
		impulse_timer = IMPULSE_LIMIT
		sprite.play("poof")

	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://World/title.tscn")

	impulse_timer -= delta

	velocity = vx + vy
		
	move_and_slide()

## Show the player characters reaction on impact
func _on_oak_marker_smacked():
	sprite.play("boom")
	score += 100
	score_label.text = "Score: %d" % score
	audio.play()


func _on_psl_target_body_entered(body):
	get_tree().change_scene_to_file("res://World/outro.tscn")
