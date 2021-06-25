tool
extends EditorPlugin


const MainPanel = preload("res://addons/BLV_Map_Editor/MainPanel.tscn")

var main_panel
var dock

func _enter_tree():
	main_panel = MainPanel.instance()
	dock = preload("res://addons/BLV_Map_Editor/MapEditorDock.tscn").instance()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(main_panel)
	# Hide the main panel. Very much required.
	make_visible(false)
	
	#add loaded scene to dock
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL,dock)


func _exit_tree():
	if main_panel:
		main_panel.queue_free()
	
	if dock:
		remove_control_from_docks(dock)
	#dock.free()


func _ready():
	print("READY")
	print(get_editor_interface().get_editor_viewport().rect_position)


func has_main_screen():
	return true
	

func make_visible(visible):
	if main_panel:
		main_panel.visible = visible


func get_plugin_name():
	return "MapEditor"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("TileMap", "EditorIcons")
