extends Control

var LEVELS_MAP = load("res://Scenes/Menus/Levels-map/LevelsMap.tscn")
var OPTIONS = preload("res://Scenes/Menus/Options/Options.tscn")
var selected_level
var selected_enemy

func _ready() -> void:
	selected_enemy= GlobalEnemy.enemy_types

func _on_options_button_pressed() -> void:
	var current_scene_path = get_tree().current_scene.scene_file_path
	var current_packed_scene = load(current_scene_path)
	
	var options_instance = OPTIONS.instantiate()
	options_instance.previous_scene = current_packed_scene
	
	get_tree().root.add_child(options_instance)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = options_instance

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(GlobalGameLogic.level_dict[GlobalGameLogic.selected_level])
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVELS_MAP)
	pass # Replace with function body.
