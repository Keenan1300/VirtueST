extends Node3D
@onready var claud = $"."
@onready var player =$"../../playerV"
@onready var head = $Armature_002/Skeleton3D
@onready var anim = $AnimationPlayer
var speed = 0.15
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Approve")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.z += speed
	if global_position.z > 7:
		speed *= -1
	if global_position.z < -7:
		speed *= -1
	
	pass
