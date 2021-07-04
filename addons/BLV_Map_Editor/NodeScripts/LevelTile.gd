tool
extends ColorRect

var offset : Vector2 #This has to be inherited
#Innate level information
var grid_position : Vector2
var grid_size : Vector2
var levelname : String
var levelpath : String
var exits = []
var icons = []
var notes : String

var mouse_in

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func add_exit(grid_position):
	var new_line = Line2D.new()
	new_line.add_point(rect_size.x)


func create_level():
	rect_position = Vector2(32 + (grid_position.x + offset.x) * 64, 32 + (grid_position.y + offset.y) * 64)
	rect_size = grid_size * 64


func _on_LevelTile_mouse_entered():
	mouse_in = true


func _on_LevelTile_mouse_exited():
	mouse_in = false


