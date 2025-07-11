extends Control


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")


func _on_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelDescription.tscn")
