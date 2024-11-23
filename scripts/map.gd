extends Node2D

var currentScene = "char_select"

var levelName2SecenDict

# Called when the node enters the scene tree for the first time.
func _ready():
	levelName2SecenDict = {
		"char_select" = $CharSelect, 
		"scene1_1" = $Scene_1_1, 
		"scene1_2" = $Scene_1_2, 
		"scene1_3" = $Scene_1_3, 
		"scene2_1" = $Scene_2_1
	}
	for level in levelName2SecenDict.values():
		level.set_layer_enabled(0, false)
	levelName2SecenDict["scene1_1"].set_layer_enabled(0, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
