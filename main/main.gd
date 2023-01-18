extends Node2D

var c = 0
var b = load("res://bear.tscn")
var t = load("res://tree.tscn")
var tree = t.instance()
var x = RandomNumberGenerator.new()
var y = RandomNumberGenerator.new()

func _ready():
	var tree = t.instance()
	var bear =  b.instance()
	bear.position = Vector2(1135,50)
	add_child(bear)
	x.randomize()
	y.randomize()
	tree.position = Vector2(x.randf(),y.randf())

func _physics_process(delta):
	var tree = t.instance()
	if c <= 10:
		add_child(tree)
		c += 1
