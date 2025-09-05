extends BaseEnemy
class_name SpawningEnemy

@export var _spawn_time: float = 1.0
@export var _spawn_type: GlobalEnemy.enemy_types = GlobalEnemy.enemy_types.FAST_ENEMY
@onready var spawn_timer: Timer = $SpawnTimer

func spawn_minion():
	var spawned = GlobalEnemy.enemy_dict[_spawn_type]
	spawned = spawned.instantiate()
	#get correct path of enemy and spawn enemy in path
	var spawned_pos = get_parent().duplicate()
	spawned_pos.get_child(0).queue_free()
	spawned_pos.add_child(spawned)
	get_parent().get_parent().add_child(spawned_pos)


func _enemy_died() -> void:
	emit_signal("enemy_died")
	spawn_minion()
	queue_free()
