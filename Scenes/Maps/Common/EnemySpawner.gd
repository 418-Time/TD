extends Node2D

@export var enemy_to_spawn: PackedScene = preload("res://Scenes/Entities/Basic-Enemy/EnemyBase.tscn")
@export var spawn_interval: float = 1.0 / 3.0 # respi średnio 1 moba na 3 sekundy
@onready var enemy_path_follow = $"../EnemyPathFollow"
var _spawn_timer: float = 0
func _physics_process(delta):
	_spawn_timer += spawn_interval * delta;
	if _spawn_timer >= spawn_interval:
		_spawn_object()
func _spawn_object() -> void:
	_spawn_timer = 0.0;
	var enemy_temp = enemy_to_spawn.instantiate()
	enemy_temp.scale = Vector2(0.2,0.2)
	enemy_temp.position = get_parent().position
	
	var part_follower = enemy_path_follow.duplicate()
	part_follower.add_child(enemy_temp)
	get_parent().add_child(part_follower)
	
