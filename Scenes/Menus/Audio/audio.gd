extends Node
@onready var back_ground_music: AudioStreamPlayer = $back_ground_music

func play_music():
	back_ground_music.play()
