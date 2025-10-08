extends StaticBody3D
@onready var Player = $"../playerV"
func interact():
	
	if (Dialogic.VAR.ClaudTalkedTo == true):
		Player.position.y += 10
		Player.position.x += 10
	else: 
		Dialogic.start("ShouldntGoHere")
		print("INTERACTED WITH") 
