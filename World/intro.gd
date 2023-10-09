extends Node2D

var show_first: bool = true

@onready var intro_card_01 = $IntroCard01
@onready var intro_card_02 = $IntroCard02

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if show_first:
			$IntroCard01.visible = false
			$IntroCard02.visible = true
			show_first = false
		else:		
			get_tree().change_scene_to_file("res://World/main.tscn")
