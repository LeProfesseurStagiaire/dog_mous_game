extends Node2D

var act_min = 0.5
var act_max = 5
var weight = 1
onready var act = act_max

func _process(delta):
	if act < act_max:
		act += 3 * delta
	else:
		act = act_max
	if Input.is_action_just_pressed("act"):
		act = act_max*0.05
	
	$Tween.interpolate_property(self,"position",position,get_global_mouse_position(),act,Tween.TRANS_QUINT,Tween.EASE_OUT)
	$Tween.start()
	rotate(get_angle_to(get_global_mouse_position())*delta*10)
	
	scale = Vector2(weight,weight)
	print(scale)

func _on_Area2D_area_entered(area):
	weight += 0.05
#	if act_max < 8 :
	act_max += 1
	if area.is_in_group("food"):
		get_tree().get_root().get_node("main").eat(area)
		
