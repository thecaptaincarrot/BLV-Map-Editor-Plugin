tool
extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("MAP EDITOR DOCK READY")
	new_tile(Vector2(1,1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func new_tile(grid_position : Vector2):
	$PanelContainer/VBoxContainer/HBoxContainer/TileVector.text = str(grid_position)


func hello_world():
	print("HELLO FROM THE DOCK")
