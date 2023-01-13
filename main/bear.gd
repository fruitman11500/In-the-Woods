extends KinematicBody2D

signal bear_damage
signal dead
var velocity = Vector2()
var moving = false
var timer = Timer.new()
var time = Timer.new()
var ti = Timer.new()
var attack = false
var player_position 
var face_left = false
var face_right = false
var health = 5
var hit = false
onready var animation = $bear_sprite

func _ready():
	timer.wait_time = 3
	time.wait_time = 2
	ti.wait_time = 1
func bear_movement():
	if moving == true:
		velocity.x = 25
		add_child(timer)
		timer.start()
		animation.animation = 'walk_right'
		face_right = true
		face_left = false
		yield(timer,'timeout')
		velocity.x = -25
		add_child(timer)
		timer.start()
		animation.animation = 'walk_left'
		face_right = false
		face_left = true
		yield(timer,"timeout")
		bear_movement()
	

func _physics_process(delta):
	move_and_slide(velocity)
	var player = get_tree().get_root().find_node("KinematicBody2D",true,false)
	player.connect("initiate",self,"handleplayerspotted")
	player.connect("damage1",self,"damage1")
	if health == 0:
		emit_signal('dead')
		queue_free()
func handleplayerspotted():
	moving = true
	bear_movement()
	
func damage1():
	if hit == true:
		health -= 1
		print (health) 
	


func attack_sequence():
	ti.wait_time = 1
	if face_left == true:
		velocity.x = 0
		add_child(time)
		time.start()
		animation.animation = 'stand_left'
		yield (time,'timeout')
		velocity.x = -25
		add_child(ti)
		ti.start()
		animation.animation = 'attack_left'
		bear_damage()
		yield (ti,'timeout')
	elif face_right == true:
		velocity.x = 0 
		animation.animation = 'stand_right'
		add_child(time)
		time.start()
		yield (time,'timeout')
		velocity.x = 25
		add_child(ti)
		ti.start()
		animation.animation = 'attack_right'
		bear_damage()
		yield (ti,'timeout')

func bear_damage():
	var t = Timer.new()
	t.wait_time = 0.5
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	yield (t,'timeout')
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	yield (t,'timeout')
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	yield (t,'timeout')
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	yield (t,'timeout')
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	yield (t,'timeout')
	add_child(t)
	t.start()
	emit_signal("bear_damage")
	
func _on_bear_sight_area_area_entered(area):
	velocity.x = 0
	attack_sequence()
	moving = false
	attack = true
	

func _on_bear_sight_area_area_exited(area):
	moving = true
	attack = false
	velocity.x = 0
	bear_movement()


func _on_hitbox_area_entered(area):
	hit = true


func _on_hitbox_area_exited(area):
	hit = false
