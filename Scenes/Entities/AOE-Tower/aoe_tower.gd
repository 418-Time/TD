extends BasicTower

class_name AoeTower
@onready var attack_area_shape: CollisionPolygon2D = $TowerGunHinge/AttackArea/AttackAreaShape
@onready var attack_area: Area2D = $TowerGunHinge/AttackArea
@export var turret_pattern : pattern

enum pattern {
	LINE,
	CONE
}

var pattern_dictionary : Dictionary = {
	pattern.LINE : PackedVector2Array([Vector2(0,5),Vector2(0,-5),Vector2(3000,-5),Vector2(3000,5)]),
	pattern.CONE : PackedVector2Array([Vector2(0,0),Vector2(800,250),Vector2(800,-250)])
}

func _ready() -> void:
	attack_area_shape.polygon = pattern_dictionary.get(turret_pattern)
	attack_area.visible = is_attack_radious_visible
	super._ready()
	
func fire_at_target(target: Node2D):
	tower_gun_hinge.look_at(target.position)
	for enemy in attack_area.get_overlapping_areas():
		if enemy.is_in_group("Enemy"):
			enemy.get_parent().take_damage(attack_damage)
	attack_timer.start()

func _on_signal_toggle_attack_area_visible() -> void :
	attack_area.visible = !is_attack_radious_visible
	super._on_signal_toggle_attack_area_visible()
