tool
extends Control

signal ReturnToOrigin
signal CreateLevel

var selected_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	print("MAP EDITOR DOCK READY")
	new_tile(Vector2(1,1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func new_tile(grid_position : Vector2):
	$PanelContainer/VBoxContainer/HBoxContainer/TileVector.text = str(grid_position)
	$PanelContainer/VBoxContainer/CreateLevelButton.disabled = false
	$PanelContainer/VBoxContainer/AddExistingButton.disabled = false
	$PanelContainer/VBoxContainer/LevelStuff.hide()
	selected_tile = grid_position


func select_level(level_node):
	#The selected tile will have all the information.
	#It must!
	pass


func deselect():
	$PanelContainer/VBoxContainer/HBoxContainer/TileVector.text = "None"
	$PanelContainer/VBoxContainer/CreateLevelButton.disabled = true
	$PanelContainer/VBoxContainer/AddExistingButton.disabled = true
	$PanelContainer/VBoxContainer/ArchiveLevel.disabled = true
	$PanelContainer/VBoxContainer/LevelStuff.hide()
	selected_tile = null

func hello_world():
	print("HELLO FROM THE DOCK")


func _on_ReturnButton_pressed():
	emit_signal("ReturnToOrigin")


func _on_CreateLevelButton_pressed():
	if selected_tile:
		emit_signal("CreateLevel",selected_tile)


func _on_MapEditor_focus_entered():
	print("SUp")
