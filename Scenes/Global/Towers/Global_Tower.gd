extends Node
enum tower_types {
	NO_TOWER,
	BASIC_TOWER,
	MINING_TOWER,
	SINGLE_ENEMY_TOWER,
	AOE_TOWER,
}

var tower_dict = {
	tower_types.BASIC_TOWER: preload("res://Scenes/Entities/Basic-Tower/BasicTower.tscn"),
	tower_types.MINING_TOWER: preload("res://Scenes/Entities/Mining-Tower/Mining-Tower.tscn"),
	tower_types.SINGLE_ENEMY_TOWER: preload("res://Scenes/Entities/Single-enemy-tower/Single-enemy-tower.tscn"),
	tower_types.AOE_TOWER: preload("res://Scenes/Entities/AOE-Tower/AOE-Tower.tscn")
}

var tower_ui_dict = {
	tower_types.BASIC_TOWER: preload("res://Assets/Images/icon.svg"),
	tower_types.MINING_TOWER: preload("res://Assets/Images/icon.svg"),
	tower_types.SINGLE_ENEMY_TOWER: preload("res://Assets/Images/icon.svg"),
	tower_types.AOE_TOWER: preload("res://Assets/Images/icon.svg"),
	tower_types.NO_TOWER: preload("res://Assets/Images/PathFlag.jpg")
}
