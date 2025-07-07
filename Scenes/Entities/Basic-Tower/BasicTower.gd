extends Node

@export var attack_speed : int
@export var attack_range_radius : int
@export var attack_damage : int
@export var attack_enemy_select : enemy_select_types
@export var is_attack_radious_visible : bool
var attack_area : Shape2D
var visible_attack_area : Area2D
var attack_timer : Timer

enum enemy_select_types {
	FIRST_ENEMY,
	LAST_ENEMY,
	MOST_HEALTH,
	LEAST_ENEMY
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
