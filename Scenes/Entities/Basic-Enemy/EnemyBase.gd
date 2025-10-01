extends CharacterBody2D
class_name BaseEnemy

# Enemy properties
@export var _speed: float = 100.0
@export var _health: float = 100.0
@export var _cash_drop: int = 50
@export var distance_to_base : float
@export var _damage_to_base: int = 1
# Reference to PathFollow2D node
var path_follow: PathFollow2D

# Signals for property changes
signal speed_changed(new_speed: float)
signal health_changed(new_health: float)
signal cash_drop_changed(new_cash_drop: int)
signal enemy_died

# Getters
func get_speed() -> float:
	return _speed

func get_health() -> float:
	return _health

func get_cash_drop() -> int:
	return _cash_drop

# Setters
func set_speed(new_speed: float) -> void:
	if new_speed >= 0:
		_speed = new_speed
		emit_signal("speed_changed", _speed)

func set_health(new_health: float) -> void:
	_health = max(0, new_health)
	emit_signal("health_changed", _health)
	if _health <= 0:
		_enemy_died()

func set_cash_drop(new_cash_drop: int) -> void:
	if new_cash_drop >= 0:
		_cash_drop = new_cash_drop
		emit_signal("cash_drop_changed", _cash_drop)

# Basic methods
func take_damage(damage: int) -> void:
	set_health(_health - damage)
	if _health <= 0:
		_enemy_died()

func heal(amount: float) -> void:
	set_health(_health + amount)

func _ready() -> void:
	# Initialize enemy with default values
	# Assumes this node is a child of PathFollow2D
	path_follow = get_parent() as PathFollow2D
	path_follow.loop = false
	if not path_follow:
		push_error("BaseEnemy must be a child of PathFollow2D")

func _enemy_died() -> void:
	emit_signal("enemy_died")
	get_parent().queue_free()
	queue_free()
	
func _process(delta: float) -> void:
	if path_follow:
		# Update PathFollow2D's progress based on speed
		path_follow.progress += _speed * delta
		distance_to_base = path_follow.progress_ratio
		if path_follow.progress_ratio == 1.0:
			GlobalEnemy.enemy_at_base.emit(_damage_to_base)
			set_health(0)
