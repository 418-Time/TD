extends Panel
@onready var options_panel: Panel = $"."
@onready var sub_general: Panel = $"./sub_general"
@onready var sub_audio: Panel = $"./sub_audio"
@onready var sub_controls: Panel = $"./sub_controls"
signal exit_options

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
	exit_options.emit()
