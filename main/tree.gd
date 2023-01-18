extends KinematicBody2D

onready var animation = $AnimatedSprite
var apples = false
var timer = Timer.new()
var pickup = false
func _ready(): 
	apples = true
	timer.wait_time = 1200
	apple_timer()

func apple_timer():
	add_child(timer)
	timer.start()
	yield(timer,'timeout')
	apples = true
	
func _physics_process(delta):
	if apples == true:
		animation.animation = 'treeapple'
	else: 
		animation.animation = 'tree'
	if apples == true and pickup == true:
		if Input.is_action_just_pressed('e'):
			apple_timer()
			apples = false


func _on_Area2D_area_entered(area):
	pickup = true


func _on_Area2D_area_exited(area):
	pickup = false
