extends Node2D

var c = 0
var b = load("res://bear.tscn")
var t = load("res://tree.tscn")

func _ready():
	var tree = t.instance()
	var bear =  b.instance()
	bear.position = Vector2(1135,50)
	add_child(bear)

func _physics_process(delta):
	pass





func _on_Player_damage2():
	pass # Replace with function body.
