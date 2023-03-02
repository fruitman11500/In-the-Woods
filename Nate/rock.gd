extends KinematicBody2D


var velocity = Vector2()

func _ready():
	velocity = Vector2()

func get_input():
	if Input.is_action_just_pressed('w'):
		velocity.y = -100
	elif Input.is_action_just_pressed('s'):
		velocity.y = 100
	if Input.is_action_just_pressed('a'):
		velocity.x = -100
	elif Input.is_action_just_pressed('d'):
		velocity.x = 100
func _physics_process(delta):
	move_and_slide(velocity)
	get_input()
