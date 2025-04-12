extends StaticBody3D
@onready var locked = $"../AudioStreamPlayer2"
func interact():
	if (Dialogic.VAR.ClaudTalkedTo == true):
		get_tree().change_scene_to_file("res://Scenes/ZIPHILIXworld.tscn")
		print("INTERACTED WITH") 
	else:
		locked.play()
		Dialogic.start("THISISLOCKED")
