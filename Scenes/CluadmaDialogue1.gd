extends StaticBody3D
@onready var Claud1Camera: Camera3D = $Claud1Camera
@onready var donedialogue1 = false
@onready var cinematicbars = $CanvasLayer
@onready var interactnoise = $"../AudioStreamPlayer2"
@onready var player = $"../playerV"
func _ready():
	Dialogic.VAR.ClaudmaInteract = true

func _process(delta):
	
	if (Dialogic.VAR.ClaudmaInteract == false):
		cinematicbars.hide();
		endinteraction()
		print("its false")
	else:
		pass

func interact():
	cinematicbars.show();
	$Claud1Camera.current = true
	Dialogic.VAR.ClaudmaInteract = true
	##Dialogic thing goes here
	
	Dialogic.start("Cluadmatimeline")
	interactnoise.play();
	print("INTERACTED WITH") 

func endinteraction():
	player.istalking = false
	$Claud1Camera.current = false
	print("Isover")
