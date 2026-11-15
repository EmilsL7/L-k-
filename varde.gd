extends CharacterBody2D

@export var player: Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var Health = 10

func _ready() -> void:
	start_loop()
	
func start_loop():
	while true:
		while Health >= 0:
			await get_tree().create_timer(3).timeout
			velocity.y = JUMP_VELOCITY
			await get_tree().create_timer(0.1).timeout
			velocity.x = clamp(player.global_position.x - global_position.x, -1, 1) * 2000



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_toward(velocity.x, 0, SPEED/5)

	move_and_slide()
