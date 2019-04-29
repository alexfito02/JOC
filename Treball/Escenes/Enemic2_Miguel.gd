extends KinematicBody2D
var velocitat = Vector2()
var velocitat_max = 1.5
var moure = false

func _process(delta):
	if moure:
		mou()
	
func mou():										#Tot el que hi ha aqui comentat eren coses que feia servir per fer proves
	#if Input.is_action_pressed("ui_right"):	 Ho he comentat per si en algun moment tornava a fer falta
	velocitat.x = -1
	#if Input.is_action_pressed("ui_left"):
		#velocitat.x = -1
	#else:
	#	velocitat.x = 0
	#if Input.is_action_pressed("ui_up"):
	#	velocitat.y = -1
	#elif Input.is_action_pressed("ui_down"):
	velocitat.y = 1
	#else:
		#velocitat.y = 0
	
	velocitat = velocitat.normalized()
	position = position + velocitat*velocitat_max
	
	#else:
	#	velocitat.x = 0
	#	velocitat.y = 0


func _on_Timer_timeout():
	print('go!')
	moure = true