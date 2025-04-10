extends StaticBody3D
@onready var Ziph1Camera: Camera3D = $"1Camera"
@onready var donedialogue1 = false
@onready var cinematicbars = $CanvasLayer
@onready var player = $"../playerV"
func _ready():
	Dialogic.VAR.ZiphInteract = true

func _process(delta):
	
	if (Dialogic.VAR.ZiphInteract == false):
		cinematicbars.hide();
		endinteraction()
		print("its false")
	else:
		pass

func interact():
	cinematicbars.show();
	$"1Camera".current = true
	Dialogic.VAR.ZiphInteract = true
	##Dialogic thing goes here
	
	Dialogic.start("Ziphilixtimeline")
	print("INTERACTED WITH") 

func endinteraction():
	player.istalking = false
	$"1Camera".current = false
	print("Isover")
