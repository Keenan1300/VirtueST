extends Node3D

var player
@onready var camera = $Camera3D
@export var sensitivity := 5
func _ready():
	player = get_tree().get_nodes_in_group("Player") [0]
	pass
	
func _process(_delta):
	global_position = player.global_position
	$Camera3D.look_at(player.get_node("LookAt").global_position)
	pass


func _input(event):
	if event is InputEventMouseMotion:
		var temprot = rotation.x - event.relative.y / 1000 * sensitivity
		rotation.y -= event.relative.x / 1000 * sensitivity
		temprot = clamp(temprot,-1,0.15) 
		rotation.x = temprot
