extends KinematicBody2D



var timer = Timer.new()

func _on_Player_axe_picked_up():
	$AnimatedSprite2.animation = 'stump'

func _ready():
	timer.wait_time = 1
	$KinematicBody2D/wood_fence_top_bottom.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite2.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite3.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite4.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite5.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite6.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite7.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite8.animation = 'wood_fence_empty'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite9.animation = 'wood_fence_empty'
	$KinematicBody2D/side_fence.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite2.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite3.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite4.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite5.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite6.animation = 'empty'
	$KinematicBody2D/side_fence/AnimatedSprite7.animation = 'empty'
	$KinematicBody2D/CollisionShape2D.disabled = true
	$KinematicBody2D/CollisionShape2D2.disabled = true
	$KinematicBody2D/CollisionShape2D3.disabled = true
	$KinematicBody2D/CollisionShape2D4.disabled = true


func _on_Area2D2_area_entered(area):
	print ('inside')
	$KinematicBody2D/wood_fence_top_bottom.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite2.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite3.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite4.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite5.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite6.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite7.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite8.animation = 'wood_fence_raise'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite9.animation = 'wood_fence_raise'
	$KinematicBody2D/CollisionShape2D.disabled = false
	$KinematicBody2D/CollisionShape2D2.disabled = false
	$KinematicBody2D/CollisionShape2D3.disabled = false
	$KinematicBody2D/CollisionShape2D4.disabled = false
	add_child(timer)
	timer.start()
	yield(timer,"timeout")
	$KinematicBody2D/wood_fence_top_bottom.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite2.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite3.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite4.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite5.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite6.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite7.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite8.animation = 'wood_fence'
	$KinematicBody2D/wood_fence_top_bottom/AnimatedSprite9.animation = 'wood_fence'
	$KinematicBody2D/side_fence.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite2.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite3.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite4.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite5.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite6.animation = 'side_fence'
	$KinematicBody2D/side_fence/AnimatedSprite7.animation = 'side_fence'
	
