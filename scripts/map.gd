extends Node2D
signal nextLevel_prepair

var currentScene = 1

var levelName2SecenDict

# Called when the node enters the scene tree for the first time.
func _ready():
	levelName2SecenDict = {
		"char_select" = $CharSelect, 
		"scene1_1" = $Scene_1_1, 
		"dungon_l1" = $Dungon,
		"dungon_l2" = $Dungon_2
	}
	for level in levelName2SecenDict.values():
		level.set_layer_enabled(0, false)
	levelName2SecenDict.values()[currentScene].set_layer_enabled(0, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	levelName2SecenDict.values()[currentScene].set_layer_enabled(0, false)
	nextLevel_prepair.emit()
	levelName2SecenDict.values()[currentScene + 1].set_layer_enabled(0, true)
	currentScene += 1
