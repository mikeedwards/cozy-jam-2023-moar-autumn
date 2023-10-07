extends Marker2D

@onready var enabler: VisibleOnScreenEnabler2D = $Enabler
@export var TREE = preload("res://Tree/tree.tscn")
var child_tree: SmackableTree = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enabler.is_on_screen() and child_tree == null:
		child_tree = TREE.instantiate()
		add_child(child_tree)

	if not enabler.is_on_screen() and child_tree != null:
		remove_child(child_tree)
		child_tree.queue_free()
