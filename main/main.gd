extends Node2D


var b = load("res://bear.tscn")

func _ready():
	var bear =  b.instance()
	bear.position = Vector2(250,100)
	add_child(bear)
