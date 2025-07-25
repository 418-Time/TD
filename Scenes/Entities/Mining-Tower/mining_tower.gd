extends Node2D

class_name MiningTower

@export var Mining_time : int
@export var Mining_amount : int
@onready var timer : Timer = $Timer

func _init() -> void:
	timer.wait_time = Mining_time
	timer.autostart = true

# to delete var
var money : int
func earn_money() -> void :
#	add global mining
	money += Mining_amount

#zawsze gdy time się skończy to się dzieje więc trzeba będzie coś zrobić jeżeli będziemy pauzować gre np. pauzować timery
func _on_timer_timeout() -> void:
	earn_money()
	pass # Replace with function body.
