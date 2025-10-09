extends Control

@onready var level_containers: Array[VBoxContainer] = [
	$LevelContainer1,
	$LevelContainer2,
	$LevelContainer3
]

@onready var indicators: Array[ColorRect] = [
	$LevelContainer1/Indicator1,
	$LevelContainer2/Indicator2,
	$LevelContainer3/Indicator3
]

@onready var buttons: Array[Button] = [
	$LevelContainer1/Button1,
	$LevelContainer2/Button2,
	$LevelContainer3/Button3
]

func _ready():
	update_indicators()
	for i in range(buttons.size()):
		buttons[i].pressed.connect(_on_button_pressed.bind(i))

func update_indicators():
	for i in range(indicators.size()):
		if GameState.is_level_cleared(i):
			indicators[i].color = Color.GREEN
		else:
			indicators[i].color = Color.RED

func _on_button_pressed(level_index: int):
	# Load the corresponding level scene
	var level_path = "res://Scenes/Maps/Map-Selector-Test-Maps/Level%d.tscn" % (level_index + 1)
	get_tree().change_scene_to_file(level_path)
