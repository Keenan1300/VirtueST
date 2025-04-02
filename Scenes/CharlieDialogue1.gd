extends StaticBody3D
@onready var Charlie1Camera: Camera3D = $Charlie1Camera
@onready var donedialogue1 = false


func _ready():
	Dialogic.VAR.Charlie1Interact = true

func _process(delta):
	
	if (Dialogic.VAR.Charlie1Interact == false):
		endinteraction()
		print("its false")
	else:
		pass

func interact():
	$Charlie1Camera.current = true
	
	##Dialogic thing goes here
	
	Dialogic.start("CharlieBones1")
	
	print("INTERACTED WITH") 

func endinteraction():
	$Charlie1Camera.current = false
	print("Isover")
