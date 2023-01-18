extends Node2D


var b = load("res://bear.tscn")

func _ready():
	var bear =  b.instance()
	bear.position = Vector2(1135,50)
	add_child(bear)
