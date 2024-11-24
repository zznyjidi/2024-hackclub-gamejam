extends Node2D

var heartIcon = preload("res://scenes/heart.tscn")
var hearsList: Array[Node2D] = []
var lastFrameHeart = 0
var lastFrameHP = 0

func _process(delta):
	if Database.playerMaxHP > lastFrameHeart:
		hearsList.append(heartIcon.instantiate())
		self.add_child(hearsList[-1])
		hearsList[-1].position = Vector2(-500 + (lastFrameHeart * 65), -240)
		lastFrameHeart += 1
	
	if Database.playerCurrentHP > lastFrameHP:
		hearsList[lastFrameHP - 1].get_child(1).visible = true
		lastFrameHP += 1
	
	if Database.playerCurrentHP < lastFrameHP:
		hearsList[lastFrameHP - 1].get_child(1).visible = false
		lastFrameHP -= 1
	
	position = get_viewport().get_camera_2d().get_screen_center_position()
