extends Node3D

@onready var chrctrb = $".."
@onready var cm = $"."
var v = Vector3()
var sns = 0.1


# Called when the node enters the scene tree for the first time.
#func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#cm.rotation_degrees.x = v.x
	#cm.rotation_degrees.y = v.y
	
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#v.y -= (event.relative.x* sns)
		#v.x -= (event.relative.y* sns)
		#v.x = clamp(v.x,-40,40)
		#v.y = clamp(v.y,-40,40)
