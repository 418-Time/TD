extends Control

const OPTIONS = preload("res://Scenes/Menus/Options/Options.tscn")
const LEVELS_MAP = preload("res://Scenes/Menus/Levels-map/LevelsMap.tscn")

func _ready() -> void:
	Audio.play_music()
	

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVELS_MAP)


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_packed(OPTIONS)


func _on_exit_button_pressed() -> void:
	get_tree().quit();
