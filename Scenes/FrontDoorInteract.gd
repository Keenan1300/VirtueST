extends StaticBody3D

func interact():
	get_tree().change_scene_to_file("res://Scenes/HouseFloorINT.tscn")
	print("INTERACTED WITH") 
