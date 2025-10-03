extends Control
var MAIN_MENU = load("res://Scenes/Menus/Main-Menu/MainMenu.tscn")

func _on_options_panel_exit_options() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)
	pass # Replace with function body.
