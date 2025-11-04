extends Control
@export var previous_scene: PackedScene

func _on_options_panel_exit_options() -> void:
	get_tree().change_scene_to_packed(previous_scene)
	pass # Replace with function body.
