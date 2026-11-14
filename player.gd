extends CharacterBody2D

var SPEED = 300
var JUMP_VELOCITY = -700.0
var Big = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if global_position.y >= 450:
		velocity.y = JUMP_VELOCITY - 350

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("small") and Big and is_on_floor():
		scale = Vector2(1.3, 0.5)
		Big = false
	if Input.is_action_just_pressed("big") and !Big:
		scale = Vector2(1, 1)
		velocity.y = JUMP_VELOCITY
		Big = true
	if Input.is_action_just_pressed("pulsors") and !is_on_floor():
		if $RayCast2D.is_colliding():
			velocity.x = 9000
		if $RayCast2D2.is_colliding():
			velocity.x = -9000
