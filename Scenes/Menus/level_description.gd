extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelInterface.tscn")
	pass
	


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelsMap.tscn")
	pass
