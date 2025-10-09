extends Node2D

func _input(event):
	if event.is_action_pressed("ui_accept"):  # Press Enter/Space to simulate completion
		GameState.set_level_cleared(get_meta("Stage")-1)  # Index 0 for Level 1
		get_tree().change_scene_to_file("res://Scenes/Menus/Map-Selector/LevelSelector.tscn")
