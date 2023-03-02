extends Control


var health = 100
func _physics_process(delta):
	$TextureProgress.value = health
	print (health)


