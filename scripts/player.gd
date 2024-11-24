extends CharacterBody2D

var Arrow = preload("res://scenes/arrow.tscn")

const SPEED = 300.0
const RUN_SPEED = SPEED * 1.5
const BLOCK_SIZE = 64

func _physics_process(delta):
	
	var direction_x = Input.get_axis("Player_Move_LEFT", "Player_Move_RIGHT")
	if direction_x:
		velocity.x = direction_x * (RUN_SPEED if Input.is_action_pressed("Player_Move_RUN") else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var direction_y = Input.get_axis("Player_Move_UP", "Player_Move_DOWN")
	if direction_y:
		velocity.y = direction_y * (RUN_SPEED if Input.is_action_pressed("Player_Move_RUN") else SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	Database.playerPosition = self.global_position

	move_and_slide()
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	velocity = velocity.slide(collision.get_normal())


func _on_node_2d_player_attact():
	var b = Arrow.instantiate()
	b.start(self.global_position, 0)
	get_tree().root.add_child(b)
