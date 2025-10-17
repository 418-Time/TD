extends Control

var OPTIONS = preload("res://Scenes/Menus/Options/Options.tscn")
var LEVEL_DESCRIPTION = load("res://Scenes/Menus/Level-Description/LevelDescription.tscn")

func _on_options_pressed() -> void:
	var current_scene_path = get_tree().current_scene.scene_file_path
	var current_packed_scene = load(current_scene_path)
	
	var options_instance = OPTIONS.instantiate()
	options_instance.previous_scene = current_packed_scene
	
	get_tree().root.add_child(options_instance)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = options_instance


func _on_1_pressed() -> void:
	GlobalGameLogic.selected_level=1
	get_tree().change_scene_to_packed(LEVEL_DESCRIPTION)
