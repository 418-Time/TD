extends Control







func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelInterface.tscn")
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelsMap.tscn")
	pass # Replace with function body.
