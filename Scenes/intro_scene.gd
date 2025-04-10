extends Control

@onready var firstpaper = $TheRetainer
@onready var letter = $TheLetter
@onready var letter2 = $TheLetter2
@onready var letter3 = $TheLetter3

func _ready():
	Dialogic.VAR.Page1 = true
	Dialogic.VAR.letter = false
	Dialogic.VAR.letter2 = false
	Dialogic.VAR.letter3 = false
	Dialogic.VAR.HouseTr = false
	firstpaper.show()
	letter.hide()
	letter2.hide()
	letter3.hide()
	Dialogic.start("IntroTimeline")
	pass # Replace with function body.

func _process(delta):
	
	if (Dialogic.VAR.Page1 == false):
		firstpaper.hide()
	if (Dialogic.VAR.letter == true):
		letter.show()
	if (Dialogic.VAR.letter2 == true):
		letter2.show()
	if (Dialogic.VAR.letter3 == true):
		letter3.show()
	if (Dialogic.VAR.HouseTr == true):
		get_tree().change_scene_to_file("res://Scenes/Mainscene.tscn")
