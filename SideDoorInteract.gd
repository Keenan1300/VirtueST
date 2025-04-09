extends StaticBody3D
@onready var player = $"../playerV"

func interact():
	player.sideentrance = true
	get_tree().change_scene_to_file("res://Scenes/HouseFloorINT.tscn")
	print("INTERACTED WITH") 
