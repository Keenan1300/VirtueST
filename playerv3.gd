extends CharacterBody3D

var animationspeed = 5
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rotspeed = 8
var lstdirection = Vector3.FORWARD
var lstmovdirection = Vector3.BACK

var _camera_input_direction := Vector2.ZERO
@export_group("Camera")
@export_range(0.0,1.0) var mousesensitivity := 0.25

@export_group("Movement")
@export var move_speed := 8.0
@export var acceleration := 20.0

@onready var _camera_pivot: Node3D = %CameraPivot
@onready var _camera: Camera3D = %Camera3D
@onready var _skin = %rig
@onready var _anim = $AnimationTree
@onready var interactor := $CameraPivot/interactor #RayCast3D Referecne
@onready var interactpopup := $CameraPivot/SpringArm3D2/Camera3D/CanvasLayer

func _input(event: InputEvent) -> void:
	
	if interactor.is_colliding():
		var target = interactor.get_collider()
		if target.has_method("interact"):
			interactpopup.show();
		else:
			interactpopup.hide();
	else:
			interactpopup.hide();
	
	if event.is_action_pressed("left_click"):
		Input.mouse_mode= Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode= Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event:InputEvent) -> void:
	var cameramotion := (
		event is InputEventMouseMotion and
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED)
	if cameramotion:
		_camera_input_direction = event.relative * mousesensitivity
	
	


func _physics_process(delta):
	
	
	
	_camera_pivot.rotation.x += _camera_input_direction.y * delta
	_camera_pivot.rotation.x = clamp(_camera_pivot.rotation.x, -PI / 6.0, PI/ 3.0)
	
	_camera_pivot.rotation.y += _camera_input_direction.x * delta
	_camera_input_direction = Vector2.ZERO
	

	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#interactive
	if Input.is_action_just_pressed("interact"):
		interact_with_Object()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	
	
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	var move_direction = forward * input_dir.y + right * input_dir.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	velocity = velocity.move_toward(move_direction * move_speed, acceleration  * delta)
	
	if not is_on_floor():
		velocity.y -= gravity * delta *5
	
	
	
	move_and_slide()
	
	if move_direction.length() > 0.2:
		lstmovdirection = move_direction
	var targetangle  := Vector3.BACK.signed_angle_to(lstmovdirection, Vector3.UP)
	_skin.global_rotation.y = lerp_angle(_skin.global_rotation.y, targetangle, rotspeed * delta)
	
	
	var groundspeed := velocity.length()
	
	if groundspeed > 0.0:
		_anim.walk()
	else:
		_anim.idle()
	
func interact_with_Object():
	if interactor.is_colliding():
		var target = interactor.get_collider()
		if target.has_method("interact"):
			target.interact()
