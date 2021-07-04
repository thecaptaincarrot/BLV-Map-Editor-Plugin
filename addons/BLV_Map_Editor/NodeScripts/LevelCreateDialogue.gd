tool
extends WindowDialog

var biomes = ["None", "City"]

var grid = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	for biome in biomes:
		$VBoxContainer/Biome/OptionButton.add_item(biome)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func Yuh():
	print("YEET")


func open_menu(grid_position):
	grid = grid_position
	$VBoxContainer/GridPosition/X.text = str(grid.x)
	$VBoxContainer/GridPosition/Y.text = str(grid.y)
	
	$VBoxContainer/LevelSize/XSize.value = 1
	$VBoxContainer/LevelSize/YSize.value = 1
	
	$VBoxContainer/Biome/OptionButton.select(0)
	
	$VBoxContainer/LevelNameBox/LevelName.text = "level " + str(grid)
	
	popup()
