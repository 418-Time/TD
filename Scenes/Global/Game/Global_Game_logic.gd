extends Node

signal win_game_signal
signal lose_game_signal

var selected_level : int = 0
var game_paused : bool = false

var level_dict = {
	1 : preload("res://Scenes/Maps/Common_with_ui/Map.tscn"),
}
var wave_dict = {
	1 : "res://Scenes/Maps/waves/test_waves.xml"
}
