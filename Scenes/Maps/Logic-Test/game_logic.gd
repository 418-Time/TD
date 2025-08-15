extends Node2D

#startowe hp do ustalenia
@export var health : int = 10
@export var enemy_stack: Array
@export var wave_number : int
@export var waves : Array
@export var concurrent_waves : int
@export var paths : Array[Node]
@export_file("*.xml") var wave_file_path: String = "res://waves/enemies.xml"
@export var Player_array : Array
@onready var wave_timer : Timer = $WaveTimer
# deafultowy wait time pomiędzy spawnem przeciwników
@export var wave_length : float
@export var enemy_parent_node : Node2D
var xml := XMLParser.new()

func _ready() -> void:
	read_waves()
	wave_timer.set_wait_time(wave_length)
	wave_timer.timeout.connect(spawn_enemy())
	# tymczasowo dodanie gracz do listy graczy
	var temp_player = player.new()
	Player_array.append(temp_player)
	
func _process(delta: float) -> void:
	if enemy_stack.size() == 0 and not enemy_parent_node.get_children().any(func(e): return e.is_in_group("Enemy")):
		wave_timer.stop()
		concurrent_waves = 1
		wave_start()
		wave_timer.start()
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
					waves[number] = []
				elif node_name == "enemy":
					var enemy_type = xml.get_attribute("type")
					var enemy_path = xml.get_attribute("path")
					waves[number].append(wave_enemy.new(enemy_type,enemy_path))

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
	wave_number += 1
	concurrent_waves += 1
	wave_start()
	# można zmienić wave_timer aby przeciwnicy spawnowali się szybciej

func spawn_enemy():
	#get enemy data and create a correct type of enemy
	var enemy = enemy_stack.pop_front()
	var spawned = GlobalEnemy.enemy_dict[enemy.type]
	#get correct path of enemy and spawn enemy in path
	paths[enemy.path].add_child(spawned)

func take_damage(damage:int):
	health -= damage
