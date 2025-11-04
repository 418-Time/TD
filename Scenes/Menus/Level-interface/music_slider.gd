extends HSlider

@export var audio_bus_name: String

var audio_bus_id

func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	var a = GlobalSettings.bus_layout[audio_bus_name]
	value = GlobalSettings.volume[a]

func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id,db)
	GlobalSettings.volume[GlobalSettings.bus_layout[audio_bus_name]] = db
	pass # Replace with function body.
