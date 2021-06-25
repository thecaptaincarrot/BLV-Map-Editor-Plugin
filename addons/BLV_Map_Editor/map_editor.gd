tool
extends EditorPlugin


const MAINWINDOW = preload("res://addons/BLV_Map_Editor/MainPanel.tscn")

var MainPanel
var Dock

func _enter_tree():
	MainPanel = MAINWINDOW.instance()
	Dock = preload("res://addons/BLV_Map_Editor/MapEditorDock.tscn").instance()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(MainPanel)
	# Hide the main panel. Very much required.
	make_visible(false)
	
	#add loaded scene to dock
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL,Dock)


func _exit_tree():
	if MainPanel:
		MainPanel.queue_free()
	
	if Dock:
		remove_control_from_docks(Dock)
		Dock.queue_free()
	#dock.free()


func _ready():
	print("MAP EDITOR READY")
	MainPanel.connect("tile_selected",self,"select_tile")


func has_main_screen():
	return true
	

func make_visible(visible):
	if MainPanel:
		MainPanel.visible = visible


func get_plugin_name():
	return "MapEditor"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("TileMap", "EditorIcons")


#Non-native functions
func select_tile(grid_position : Vector2):
	print("Selected Map tile: ", grid_position)
	Dock.new_tile(grid_position)
