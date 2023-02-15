var attack_time=Timer.new()
var attack=false
func attack_sequence():
	attack_time.wait_time=3
	add_child(timer)
	timer.start()
	velocity.x=25
	velocity.y=25
	yield(timer,'timeout')
	add.child(timer)
	timer.start()
	velocity.x=25
	velocity.y=25
func _on_Attack_Area_area_entered(area):
	attack = true
	attack_sequence()
	velocity.x=1
	velocity.y=1
