extends StaticBody3D

func interact():
	if (Dialogic.VAR.ClaudTalkedTo == true):
		get_tree().change_scene_to_file("res://Scenes/ZIPHILIXworld.tscn")
		print("INTERACTED WITH") 
