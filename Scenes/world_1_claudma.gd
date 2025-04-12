extends Node3D
@onready var Darkscreen = $Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("ScenebeforeClaud")
	$AudioStreamPlayer.play()
	
	
	
	
	pass # Replace with function body.
func _process(delta):
		if(Dialogic.VAR.BarrierDownCL == false):
			Darkscreen.show()
		else:
			Darkscreen.hide()
