extends Node2D

#startowe hp do ustalenia
@export var health : int = 10
@export var enemy_stack: Array
@export var waves : Array
@export var wave_number : int = 0
# deafultowy wait time pomiędzy spawnem przeciwników to wpływa na formułę do ustalenia jeszcze w _process
@export var wave_length : float
@export var concurrent_waves : int
@onready var wave_timer : Timer = $WaveTimer
@export var enemy_parent_node : Node2D
@export var Player_array : Array
@export var paths : Array[Node]
@export_file("*.xml") var wave_file_path: String = "res://waves/enemies.xml"
var xml := XMLParser.new()
var max_waves : int 

func _ready() -> void:
	read_waves()
	max_waves = waves.size()
	wave_timer.set_wait_time(wave_length)
	wave_timer.timeout.connect(spawn_enemy)
	# tymczasowo dodanie gracz do listy graczy
	var temp_player = player.new()
	Player_array.append(temp_player)
	GlobalEnemy.enemy_at_base.connect(take_damage)
	wave_number = -1
	wave_timer.start()
	
func _process(delta: float) -> void:
	if enemy_stack.size() == 0 and not enemy_parent_node.get_children().any(func(e): return e.is_in_group("Enemy")) and not wave_timer.is_stopped():
		wave_timer.stop()
		skip_to_next_wave()
		concurrent_waves = 1
		wave_timer.start()
	
	# formuła na czas między spawnem jest jeszcze do ustalenia
	if wave_timer.get_wait_time() != wave_length * ( 2 / concurrent_waves ):
		wave_timer.set_wait_time(wave_length * ( 2 / concurrent_waves ))

func read_waves():
	var number = 0
	xml.open(wave_file_path)
	while xml.read() == OK:
		match xml.get_node_type():
			XMLParser.NODE_ELEMENT:
				var node_name = xml.get_node_name()
				if node_name == "wave":
					waves.append([])
					number += 1
				elif node_name == "enemy":
					var enemy_type = GlobalEnemy.enemy_types[xml.get_attribute_value(0)]
					var enemy_path = int(xml.get_attribute_value(1))
					waves[number - 1].append(wave_enemy.new(enemy_type,enemy_path))

func add_player(player: Node):
	Player_array.append(player)
	
func del_player(player: Node):
	Player_array.erase(player)

func earn_money(money:int):
	for player in Player_array:
		player.Earn(money)

func wave_start():
	while waves[wave_number].size() != 0:
		enemy_stack.append(waves[wave_number].pop_front())
	
func skip_to_next_wave():
	if wave_number < max_waves-1:
		wave_number += 1
		concurrent_waves += 1
		wave_start()

func spawn_enemy():
	#get enemy data and create a correct type of enemy
	var enemy = enemy_stack.pop_front()
	if enemy != null:
		var spawned = GlobalEnemy.enemy_dict[enemy.type]
		spawned = spawned.instantiate()
		#get correct path of enemy and spawn enemy in path
		var spawned_pos = paths[enemy.path].duplicate()
		spawned_pos.add_child(spawned)
		enemy_parent_node.add_child(spawned_pos)

func take_damage(damage:int):
	health -= damage
