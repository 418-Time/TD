class_name wave_enemy
# class used to load enemy types from file

var type: GlobalEnemy.enemy_types
var path: int

func _init(_type: GlobalEnemy.enemy_types, _path: int,):
		type = _type
		path = _path
