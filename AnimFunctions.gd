extends AnimationTree

var state
var previous_state
@onready var state_machine = $AnimationPlayer
@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func idle():
	state_machine.play("Idle")
	set("Parameters/Conditions.Idle",1.0)

func walk():
	state_machine.play("Walk")
	set("Parameters/Conditions.Walk",1.0)
	
func grab():
	state_machine.play("Grab")
	set("Parameters/Conditions.Grab",1.0)
	
func talk():
	state_machine.play("Talk")
	set("Parameters/Conditions.Talk",1.0)

func think():
	state_machine.play("Thinking")
	set("Parameters/Conditions.Think",1.0)

func strict():
	state_machine.play("Strict")
	set("Parameters/Conditions.Strict",1.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
