extends CharacterBody2D
# Temporary test enemy
@export var speed := 100
@export var health := 10
@export var distance_to_base := 10

func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta

func take_damage(amount : int):
	health -= amount
	if health <= 0:
		queue_free()
