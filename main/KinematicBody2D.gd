extends KinematicBody2D

var velocity = Vector2()
onready var animation = $AnimatedSprite
var attack_cooldown = false
var face_right = true
var face_left = false
var can_move = true
var hidden = false
var axe = false
var bow = false
var rock = false
var knife = false
var rifle = false
var shotgun = false
var pistol = false
var fist = true
var fist_attack = false
var spear = false
var attack_timer = Timer.new()

func _ready():
	attack_timer.wait_time = 0.5
	animation.animation = 'stand_right'

func get_input():
	if can_move == true:
		if Input.is_action_pressed("a"):
			velocity.x = -1
			animation.animation = 'walk_left'
			face_left = true
			face_right = false
		elif Input.is_action_pressed('d'):
			velocity.x = 1
			animation.animation = 'walk_right'
			face_left = false
			face_right = true 
		elif Input.is_action_just_released("a"):
			animation.animation = 'stand_left'
		elif Input.is_action_just_released("d"):
			animation.animation = 'stand_right'
		else:
			velocity.x = 0
		if Input.is_action_pressed("w"):
			velocity.y = -1
			if face_left == true:
				animation.animation = 'walk_left'
			elif face_right == true:
				animation.animation = 'walk_right'
		elif Input.is_action_pressed('s'):
			velocity.y = 1
			if face_left == true:
				animation.animation = 'walk_left'
			elif face_right == true:
				animation.animation = 'walk_right'
		elif Input.is_action_just_released("s"):
			if face_left == true:
				animation.animation = 'stand_left'
			elif face_right == true:
				animation.animation = 'stand_right'
		elif Input.is_action_just_released('w'):
			if face_left == true:
				animation.animation = 'stand_left'
			elif face_right == true:
				animation.animation = 'stand_right'
		else:
			velocity.y = 0
	if Input.is_action_pressed("shift"):
		if face_left == true:
			animation.animation = 'crouch_left'
		elif face_right == true:
			animation.animation = 'crouch_right'
		hidden = true
		can_move = false
		velocity.x = 0
		velocity.y = 0
	elif Input.is_action_just_released("shift"):
		if face_left == true:
			animation.animation = 'stand_left'
		elif face_right == true:
			animation.animation = 'stand_right'
		hidden = false
		can_move = true
		velocity.x = 0
		velocity.y = 0
	if Input.is_action_just_pressed("left_mouse"):
		if attack_cooldown == false:
			if fist == true:
				add_child(attack_timer)
				attack_timer.start()
				attack_cooldown = true
				if face_left == true:
					animation.animation = 'punch_left'
				elif face_right == true:
					animation.animation = "punch_right"
				yield (attack_timer,"timeout")
				if face_left == true:
					animation.animation = 'stand_left'
				elif face_right == true:
					animation.animation = 'stand_right'
				attack_cooldown = false
				
		

func _physics_process(delta):
	get_input()
	move_and_slide(velocity * 100)
	print ('face_right', face_right)
	print ('face_left',face_left)
