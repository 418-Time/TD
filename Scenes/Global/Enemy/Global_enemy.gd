extends Node
enum enemy_types {
	TEST,
	TEST2,
	TEST3
} 
var enemy_dict = {
	enemy_types.TEST: preload("res://Scenes/Entities/Basic-Enemy/EnemyBase.tscn"),
	enemy_types.TEST2: preload("res://Scenes/Entities/Basic-Enemy/EnemyBase.tscn"),
	enemy_types.TEST3: preload("res://Scenes/Entities/Basic-Enemy/EnemyBase.tscn")
}

signal enemy_at_base(damage)
