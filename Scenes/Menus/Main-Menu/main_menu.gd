extends Control

const OPTIONS = preload("res://Scenes/Menus/Options/Options.tscn")
const LEVELS_MAP = preload("res://Scenes/Menus/Levels-map/LevelsMap.tscn")

func _ready() -> void:
	Audio.play_music()
	

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVELS_MAP)


func _on_options_pressed() -> void:
	var current_scene_path = get_tree().current_scene.scene_file_path
	var current_packed_scene = load(current_scene_path)
	
	var options_instance = OPTIONS.instantiate()
	options_instance.previous_scene = current_packed_scene
	
	get_tree().root.add_child(options_instance)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = options_instance


func _on_exit_button_pressed() -> void:
	get_tree().quit();
