extends Control

@onready var tower_list: ItemList = $TowerList
@onready var selected_list: ItemList = $SelectedList
var unlocked_towers : Array[GlobalTower.tower_types]
const Player = preload("res://Scenes/Global/Player/Player.gd")

func _ready() -> void:
	# tworzymy empty nowego gracza z dostępem do wszystkich turetów ( tower o id 0 to "pusty slot" więc go nie dodajemy)
	GlobalPlayer.local_player = Player.new([1,2,3,4],[])
	
	unlocked_towers = GlobalPlayer.local_player.towers_unlocked
	for tower in unlocked_towers:
		tower_list.add_icon_item(GlobalTower.tower_ui_dict[tower],true)
	_load_selected_towers()
	tower_list.item_selected.connect(select_tower)
	selected_list.item_selected.connect(deselect_tower)

func _load_selected_towers():
	selected_list.clear()
	for tower in GlobalPlayer.local_player.towers_selected:
		selected_list.add_icon_item(GlobalTower.tower_ui_dict[tower],true)

func select_tower(index) :
	GlobalPlayer.local_player.select_tower(unlocked_towers[index])
	_load_selected_towers()
	
func deselect_tower(index) :
	GlobalPlayer.local_player.deselect_tower(index)
	_load_selected_towers()
