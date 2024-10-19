extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle movement.
	var direction := 0.0
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		direction = -1.0
	elif Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		direction = 1.0
	
	# Apply movement or deceleration.
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
