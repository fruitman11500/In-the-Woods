extends KinematicBody2D

var attack_sequence = false

func _on_activation_area_old_man_area_entered(area):
	attack_sequence = true
