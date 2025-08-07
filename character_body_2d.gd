extends CharacterBody2D

const GRAVITY = 420.0
const MOVE_SPEED = 540.0
const JUMP_FORCE = -500.0

@onready var sprite: Sprite2D

func _physics_process(delta: float) -> void:
	# Yerçekimi uygula
	velocity.y += GRAVITY * delta

	# Yön kontrolü
	var direction = 0
	if Input.is_action_pressed("move_right"): # D
		direction = 1
		if sprite:
			sprite.flip_h = false
	elif Input.is_action_pressed("move_left"): # A
		direction = -1
		if sprite:
			sprite.flip_h = true

	# Yatay hareket
	velocity.x = direction * MOVE_SPEED

	# Zıplama (W)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Hareketi uygula
	move_and_slide() 
