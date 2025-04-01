extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var Lookat
var lastlookatdirection : Vector3
func _ready():
	Lookat = get_tree().get_nodes_in_group("Cameracontroller")[0].get_node("LookAt")
func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		var lerpdirection = lerp(lastlookatdirection,Vector3(Lookat.global_position.x,global_position.y,Lookat.global_position.z), 0.5 )
		look_at(Vector3(lerpdirection.x,global_position.y,lerpdirection.z))
		lastlookatdirection = lerpdirection
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	$AnimationTree.set("parameters/conditions/idle",input_dir == Vector2.ZERO && is_on_floor())
	$AnimationTree.set("parameters/conditions/walk",input_dir != Vector2.ZERO && is_on_floor())
	$AnimationTree.set("parameters/conditions/falling",!is_on_floor())
	$AnimationTree.set("parameters/conditions/landed", is_on_floor())
	
	move_and_slide()
	
	

