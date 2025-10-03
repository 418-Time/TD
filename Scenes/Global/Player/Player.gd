extends Node
class_name player
# A function containing variables and functions needed for players

var money : int = 0
var max_tower_selected := 5
var towers_unlocked : Array[GlobalTower.tower_types]
var towers_selected : Array[GlobalTower.tower_types]

func _init(unlocked : Array[GlobalTower.tower_types] = [], selected : Array[GlobalTower.tower_types] = []) -> void:
	towers_unlocked = unlocked
	if selected == []:
		for x in range(max_tower_selected):
			towers_selected.append(GlobalTower.tower_types.NO_TOWER)
	else:
		towers_selected = selected

func Earn(number:int):
	money+=number

func select_tower(tower : GlobalTower.tower_types):
	var space = towers_selected.find(GlobalTower.tower_types.NO_TOWER)
	if towers_selected.has(tower) == false:
		towers_selected[space] = tower

func deselect_tower(index):
	if towers_selected[index] != GlobalTower.tower_types.NO_TOWER:
		towers_selected[index] = GlobalTower.tower_types.NO_TOWER
