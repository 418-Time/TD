extends Control


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelsMap.tscn")


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit();
