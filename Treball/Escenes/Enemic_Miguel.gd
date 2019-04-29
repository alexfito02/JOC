extends KinematicBody2D
var velocitat = Vector2()

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocitat.x = 100
	elif Input.is_action_pressed("ui_left"):
		velocitat.x = -100
	elif Input.is_action_pressed("ui_up"):
		velocitat.y = -100
	elif Input.is_action_pressed("ui_down"):
		velocitat.x = 100
	else:
		velocitat.x = 0
		velocitat.y = 0
