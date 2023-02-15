var attack_time=Timer.new()
func _ready():
	attack_sequence()
	attack_time.wait_time=3
	add_child(timer)
	if velocity:
		
	timer.start()
	yield(timer,'timeout')
func attack_sequence():
	 
