extends Control

var OPTIONS = load("res://Scenes/Menus/Options/Options.tscn")
var LEVEL_DESCRIPTION = load("res://Scenes/Menus/Level-Description/LevelDescription.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_packed(OPTIONS)


func _on_1_pressed() -> void:
	GlobalGameLogic.selected_level=1
	get_tree().change_scene_to_packed(LEVEL_DESCRIPTION)
