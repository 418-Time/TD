extends Control

var LEVEL_MAP := preload("res://Scenes/Menus/Levels-map/LevelsMap.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_MAP)
	queue_free()
	pass # Replace with function body.
