extends Node

class_name BasicTower

@export var attack_speed : int
@export var attack_range_radius : int
@export var attack_damage : int
@export var attack_enemy_select : enemy_select_types
@export var is_attack_radious_visible : bool
@export var enemies_in_range : Array[Node2D]
var attack_area : Shape2D
var visible_attack_area : Area2D
var attack_timer : Timer
@onready var tower_gun_hinge: Node2D = $TowerGunHinge

enum enemy_select_types {
	FIRST_ENEMY,
	LAST_ENEMY,
	MOST_HEALTH,
	LEAST_HEALTH
}

func _ready() -> void: 
	attack_area = get_node_or_null("AttackArea/AttackCollisionShape").shape
	attack_timer = get_node_or_null("AttackTimer")
	visible_attack_area = get_node_or_null("AttackArea")
	visible_attack_area.visible = is_attack_radious_visible
	attack_area.radius = attack_range_radius
	attack_timer.wait_time = attack_speed

func _on_signal_toggle_attack_area_visible():
	is_attack_radious_visible = !is_attack_radious_visible
	visible_attack_area.visible = is_attack_radious_visible
	
func _process(delta: float) -> void:
	if enemies_in_range.size() == 0:
		return
	if attack_timer.is_stopped():
		aim_to_target()
		
func aim_to_target():
	var target : Node2D
	match attack_enemy_select:
		enemy_select_types.FIRST_ENEMY:
			var min_distance : int = -1
			for x in enemies_in_range:
				if min_distance > x.distance_to_base || min_distance == -1:
					min_distance = x.distance_to_base
					target = x
		enemy_select_types.LAST_ENEMY:
			var max_distance : int = -1
			for x in enemies_in_range:
				if max_distance < x.distance_to_base || max_distance == -1:
					max_distance = x.distance_to_base
					target = x
		enemy_select_types.MOST_HEALTH:
			var max_health : int = -1
			for x in enemies_in_range:
				if max_health < x.health || max_health == -1:
					max_health = x.health
					target = x
		enemy_select_types.LEAST_HEALTH:
			var max_health : int = -1
			for x in enemies_in_range:
				if max_health > x.health || max_health == -1:
					max_health = x.health
					target = x
	# samo strzelanie nie wybieranie przeciwnika
	target.take_damage(attack_damage)
	tower_gun_hinge.look_at(target.position)
	attack_timer.start()

func _on_attack_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemies_in_range.append(area.get_parent())
	pass # Replace with function body.


func _on_attack_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemies_in_range.erase(area.get_parent())
	pass # Replace with function body.
