extends Control


func _ready():
	
	
	# Button connection
	$MenuBar/Button.connect("pressed", on_restart_pressed)
	
	pass


func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode= Input.MOUSE_MODE_VISIBLE


func  on_restart_pressed():
	print("Start")
	#get_tree().change_scene_to_file("res://Scenes/Important Scenes/CabinBedRoom.tscn")
	get_tree().change_scene_to_file("res://Scenes/IntroScene.tscn")  # Load the next scene


func _process(delta):
	pass
