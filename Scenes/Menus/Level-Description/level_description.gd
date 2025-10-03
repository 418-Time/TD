extends Control

var LEVELS_MAP = load("res://Scenes/Menus/Levels-map/LevelsMap.tscn")
var selected_level
var selected_enemy
func _ready() -> void:
	selected_enemy= GlobalEnemy.enemy_types



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(GlobalGameLogic.level_dict[GlobalGameLogic.selected_level])
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVELS_MAP)
	pass # Replace with function body.
