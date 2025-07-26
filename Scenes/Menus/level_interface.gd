extends Control
@onready var menu: Panel = $menu
@onready var resume_button: Button = $menu/VBoxContainer/resume_button
@onready var options_button: Button = $menu/VBoxContainer/options_button
@onready var quit_button: Button = $menu/VBoxContainer/quit_button
@onready var options_panel: Panel = $options_panel
@onready var sub_general: Panel = $options_panel/sub_general
@onready var sub_audio: Panel = $options_panel/sub_audio
@onready var sub_controls: Panel = $options_panel/sub_controls

func _ready():
	options_panel.visible = false
	menu.visible = false
	pass

func _on_general_button_pressed() -> void:
	sub_general.visible = true
	sub_audio.visible = false
	sub_controls.visible = false
	pass # Replace with function body.

func _on_audio_button_pressed() -> void:
	sub_general.visible = false
	sub_audio.visible = true
	sub_controls.visible = false
	pass # Replace with function body.

func _on_controlls_button_pressed() -> void:
	sub_general.visible = false
	sub_audio.visible = false
	sub_controls.visible = true
	pass # Replace with function body.

func _on_exit_button_pressed() -> void:
	options_panel.visible = false
	menu.visible = true
	pass # Replace with function body.

func _on_menu_button_pressed() -> void:
	menu.visible = true
	pass # Replace with function body.

func _on_resume_button_pressed() -> void:
	menu.visible = false
	pass # Replace with function body.

func _on_options_button_pressed() -> void:
	menu.visible = false
	options_panel.visible = true
	_on_general_button_pressed()
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit();
	pass # Replace with function body.

func _on_main_menu_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
	pass # Replace with function body.

func _on_main_menu_button_pressed() -> void:
	pass # Replace with function body.

func _on_map_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/LevelsMap.tscn")
	pass # Replace with function body.
