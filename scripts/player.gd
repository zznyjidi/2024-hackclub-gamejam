extends CharacterBody2D


const SPEED = 300.0
const RUN_SPEED = SPEED * 1.5
const BLOCK_SIZE = 64


func _physics_process(delta):
	
	var direction_y = Input.get_axis("Player_Move_UP", "Player_Move_DOWN")
	if direction_y:
		if Input.is_action_pressed("Player_Move_RUN"):
			velocity.y = direction_y * RUN_SPEED
		else:
			velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var direction_x = Input.get_axis("Player_Move_LEFT", "Player_Move_RIGHT")
	if direction_x:
		if Input.is_action_pressed("Player_Move_RUN"):
			velocity.x = direction_x * RUN_SPEED
		else:
			velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	velocity = velocity.slide(collision.get_normal())
