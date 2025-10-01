extends Node
enum enemy_types {
	SMALL_ENEMY,
	FAST_ENEMY,
	TANKY_ENEMY,
	SPAWNING_ENEMY,
} 
var enemy_dict = {
	enemy_types.SMALL_ENEMY: preload("res://Scenes/Entities/Small-Enemy/SmallEnemy.tscn"),
	enemy_types.FAST_ENEMY: preload("res://Scenes/Entities/Fast-Enemy/FastEnemy.tscn"),
	enemy_types.TANKY_ENEMY: preload("res://Scenes/Entities/Tanky-Enemy/TankyEnemy.tscn"),
	enemy_types.SPAWNING_ENEMY: preload("res://Scenes/Entities/Spawning-Enemy/SpawningEnemy.tscn"),
}

signal enemy_at_base(damage)
