extends KinematicBody2D
signal old_man_boss_start
signal health_1
signal health_2
var damage = false
var velocity = Vector2()
var timer = Timer.new()
var time = Timer.new()
var health = 100

func _ready():
	global_position = Vector2(950,1000)
	timer.wait_time = 5
	time.wait_time = 13
	
func attack_sequence():
	velocity.x = 0
	velocity.y = -50
	add_child(timer)
	timer.start()
	yield (timer, 'timeout')
	velocity.y = 0 
	velocity.x = -50
	add_child(time)
	time.start()
	yield (time, 'timeout')
	add_child(timer)
	velocity.x = 0
	velocity.y = 50
	timer.start()
	yield (timer,'timeout')
	velocity.y = 0
	velocity.x = 50
	add_child(time)
	time.start()
	yield(time,'timeout')
	attack_sequence()
func _on_activation_area_old_man_area_entered(area):
	print ('penis')
	attack_sequence()

func _physics_process(delta):
	move_and_slide(velocity)


func _on_hitbox_area_entered(area):
	damage = true


func _on_Player_damage1():
	if damage == true:
		health -= 2
		emit_signal('health_1')


func _on_Player_damage2():
	if damage == true:
		health -= 5
		emit_signal("health_2")


func _on_hitbox_area_exited(area):
	damage = false
