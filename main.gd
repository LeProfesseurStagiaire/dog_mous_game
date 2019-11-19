extends Node2D

onready var food = preload("res://food.tscn")
var score = 0

func _on_Timer_timeout():
	randomize()
	var f = food.instance()
	add_child(f)
	f.position = Vector2(rand_range(0,get_viewport_rect().size.x),rand_range(0,get_viewport_rect().size.y))
	$Timer.start(rand_range(1,1.5))

func eat(food):
	$Label.text = "score : " + str(score)
	get_node(food.get_path()).get_parent().queue_free()
	score += 1