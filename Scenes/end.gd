extends StaticBody3D

func interact():
	if (Dialogic.VAR.ClaudEnlighten == true && Dialogic.VAR.ZiphEnlighten == true):
		get_tree().change_scene_to_file("res://Scenes/GoodEnding.tscn")
		print("INTERACTED WITH") 
	else:
		get_tree().change_scene_to_file("res://Scenes/OddEnding.tscn")
