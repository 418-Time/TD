extends Node2D

@onready var ground_layer: TileMapLayer = $GroundLayer
@onready var turret_scene: PackedScene = preload("res://Scenes/Entities/Basic-Tower/BasicTower.tscn")

var placed_turret_atlas_cord : Vector2i = Vector2i(30,0)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Place Tower"):
		var mouse_pos = ground_layer.get_local_mouse_position()
		
		var grid_mouse_pos = ground_layer.local_to_map(mouse_pos)
		
		var tile_data : TileData = ground_layer.get_cell_tile_data(grid_mouse_pos)
		if tile_data:
			if tile_data.get_custom_data("buildable"):
				ground_layer.set_cell(grid_mouse_pos,1, placed_turret_atlas_cord)
				var turret = turret_scene.instantiate()
				turret.position = ground_layer.map_to_local(grid_mouse_pos)
				turret.scale = Vector2(0.2,0.2)
				add_child(turret)
	
