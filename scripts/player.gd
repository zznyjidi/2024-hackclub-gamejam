extends CharacterBody2D


const SPEED = 300.0
const BLOCK_SIZE = 64


func _physics_process(delta):
	
	var direction_y = Input.get_axis("Player_Move_UP", "Player_Move_DOWN")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var direction_x = Input.get_axis("Player_Move_LEFT", "Player_Move_RIGHT")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
