tool
extends Control

var viewport_position

var grid_offset = Vector2(1,1)

signal tile_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton and is_visible_in_tree() and event.button_index == BUTTON_LEFT and event.pressed:
		var viewport_position = get_local_mouse_position() - Vector2(6,4) #offset
		if viewport_position.x < 32 or viewport_position.y < 32:
			return
		var grid_position = Vector2(stepify(viewport_position.x,64)/64,stepify(viewport_position.y,64)/64) - grid_offset
		emit_signal("tile_selected",grid_position)
