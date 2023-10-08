extends Marker2D

signal smacked

@export var TREE = preload("res://Tree/tree.tscn")
@export var spirit: Spirit

var child_tree: SmackableTree = null

@onready var enabler: VisibleOnScreenEnabler2D = $Enabler

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("smacked", spirit._on_oak_marker_smacked)
	pass # Replace with function body.

func smackarooni():
	smacked.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if enabler.is_on_screen() and child_tree == null:
		child_tree = TREE.instantiate()
		child_tree.connect("smackarooni", smackarooni)
		add_child(child_tree)

	if not enabler.is_on_screen() and child_tree != null:
		remove_child(child_tree)
		child_tree.queue_free()
