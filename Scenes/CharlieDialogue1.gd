extends StaticBody3D
@onready var Charlie1Camera: Camera3D = $Charlie1Camera
@onready var donedialogue1 = false
@onready var cinematicbars = $CanvasLayer

func _ready():
	Dialogic.VAR.Charlie1Interact = true

func _process(delta):
	
	if (Dialogic.VAR.Charlie1Interact == false):
		cinematicbars.hide();
		endinteraction()
		print("its false")
	else:
		pass

func interact():
	cinematicbars.show();
	$Charlie1Camera.current = true
	Dialogic.VAR.Charlie1Interact = true
	##Dialogic thing goes here
	
	Dialogic.start("CharlieBones1")
	
	print("INTERACTED WITH") 

func endinteraction():
	$Charlie1Camera.current = false
	print("Isover")
