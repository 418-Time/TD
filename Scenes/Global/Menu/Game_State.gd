extends Node

var cleared_levels: Array[bool] = [false, false, false]

func _ready():
	load_state()

func set_level_cleared(level_index: int):
	if level_index >= 0 and level_index < cleared_levels.size():
		cleared_levels[level_index] = true
		save_state()

func is_level_cleared(level_index: int) -> bool:
	if level_index >= 0 and level_index < cleared_levels.size():
		return cleared_levels[level_index]
	return false

func save_state():
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	if file:
		for cleared in cleared_levels:
			file.store_8(cleared as int)
		file.close()

func load_state():
	if FileAccess.file_exists("user://savegame.save"):
		var file = FileAccess.open("user://savegame.save", FileAccess.READ)
		if file:
			for i in range(cleared_levels.size()):
				cleared_levels[i] = file.get_8() != 0
			file.close()
