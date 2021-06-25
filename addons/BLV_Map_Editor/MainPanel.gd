tool
extends Control

var viewport_position

signal tile_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton and is_visible_in_tree():

		print (get_local_mouse_position() - Vector2(6,4))
