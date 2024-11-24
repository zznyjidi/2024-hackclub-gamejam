extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
#	print(Database.playerPosition - self.global_position)
	var distance = hypot(Database.playerPosition - self.global_position)
	if distance > Database.enemyVision:
		velocity = Vector2(0, 0)
	elif distance > 80:
		var direction = (Database.playerPosition - self.global_position).normalized()
		var acceleration = direction * SPEED/30
		velocity += acceleration
		velocity *= 0.98
	elif distance > 60:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity = -(Database.playerPosition - self.global_position)

	move_and_slide()

func hypot(pos: Vector2) -> float:
	return sqrt(pos.x**2 + pos.y**2)
