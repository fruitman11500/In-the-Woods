extends KinematicBody2D

signal initiate
signal damage1
signal damage2 
signal damage3
signal axe_picked_up

var velocity = Vector2()
var enter = false
var exit = false
onready var animation = $AnimatedSprite
var attack_cooldown = false
var face_right = true
var face_left = false
var can_move = true
var hidden = false
var axe = false
var axe_pickup = false
var axe_safety = false
var axe_available = false
var bow = false
var rock = false
var knife = false
var rifle = false
var shotgun = false
var pistol = false
var fist = true
var fist_attack = false
var spear = false
var health = 10
var attack_timer = Timer.new()
var hit = false
var bear_dead = false
var player_position = global_position
var rocks = 100
var r = load("res://rock projectile.tscn")
var rock_projectile = null


func _ready():
	var rock_projectile = r.instance()
	attack_timer.wait_time = 0.5
	animation.animation = 'stand_left'
	$hidden_crouched/CollisionShape2D.disabled = true
	$sight_area/CollisionShape2D.disabled = false
	health = 10
	global_position = Vector2(-128,32)
func get_input():
	if can_move == true:
		if Input.is_action_pressed("a"):
			$Node2D.rotation = 1.55
			velocity.x = -1
			animation.animation = 'walk_left'
			face_left = true
			face_right = false
		elif Input.is_action_pressed('d'):
			$Node2D.rotation = 4.73
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
			$Node2D.rotation = 3.175
			velocity.y = -1
			if face_left == true:
				animation.animation = 'walk_left'
			elif face_right == true:
				animation.animation = 'walk_right'
		elif Input.is_action_pressed('s'):
			$Node2D.rotation = 0
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
	if Input.is_action_just_pressed('t'):
		shoot()
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
				emit_signal("damage1")
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
			if axe == true:
				add_child(attack_timer)
				attack_timer.start()
				attack_cooldown = true
				emit_signal("damage2")
				if face_left == true:
					animation.animation = 'axe_left'
				elif face_right == true:
					animation.animation = "axe_right"
				yield (attack_timer,"timeout")
				if face_left == true:
					animation.animation = 'stand_left'
				elif face_right == true:
					animation.animation = 'stand_right'
				attack_cooldown = false
				
	if Input.is_action_just_pressed('0'):
		fist = true
		axe = false
	elif Input.is_action_just_pressed('1'):
		if axe_available == true:
			axe = true
			fist = false
func game_processes():
	if hidden == true:
		$hidden_crouched/CollisionShape2D.disabled = false
		$sight_area/CollisionShape2D.disabled = true
	elif hidden == false:
		$hidden_crouched/CollisionShape2D.disabled = true
		$sight_area/CollisionShape2D.disabled = false
func _physics_process(delta):
	print ($Node2D.rotation)
	game_processes()
	get_input()
	move_and_slide(velocity * 100)
	var bear = get_tree().get_root().find_node("bear",true,false)
	if bear_dead == false:
		bear.connect("bear_damage",self,"bear_damage")
		bear.connect('dead', self, 'bear_dead')
	if health == 0:
		pass
	if enter == true:
		if Input.is_action_just_pressed('e'):
			position = Vector2(-1500,-1000)
			enter = false
	if exit == true:
		if Input.is_action_just_pressed('e'):
			position = Vector2(400,900)
			exit = false
	if axe_pickup == true and axe_safety == false:
		if Input.is_action_just_pressed('e'):
			axe_available = true
			emit_signal("axe_picked_up")
func shoot():
	if rocks >= 1:
		rock_projectile.global_position = $Node2D/Position2D.global_position
		add_child(rock_projectile)
func bear_damage():
	if hit == true:
		health -= 2

func bear_dead():
	bear_dead = true

func _on_Activation_Area_area_entered(area):
	emit_signal('initiate')


func _on_small_melee_area_entered(area):
	hit = true
func _on_small_melee_area_exited(area):
	hit = false


func _on_door_enter_area_entered(area):
		enter = true

func _on_door_enter_area_exited(area):
	enter = false


func _on_Area2D_area_entered(area):
	exit = true


func _on_Area2D_area_exited(area):
	exit = false


func _on_axe_stump_area_entered(area):
	axe_pickup = true


func _on_axe_stump_area_exited(area):
	axe_pickup = false


func _on_hitbox_area_entered(area):
	health -= 5


func _on_hitbox_area_exited(area):
	pass
