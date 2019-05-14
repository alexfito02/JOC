extends KinematicBody2D
var velocitatpocapoc = 150
var velocitatmaxima = 250
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
var punts = 0
var contador = 1
func _physics_process(delta):
	mou()
	
func _process(delta):
	anima()
	if position.y > 1000:
		mor()

func mou():
	velocitat.x = 0
	if velocitat.x == 0 and velocitat.y == 0 and is_on_floor():
		punts = 1000
	if Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatpocapoc
		if abs(velocitat.y) > 1 and contador == 0:
			punts = 0
		elif abs(velocitat.y) > 1 and contador == 1:
			punts = 5
		elif abs(velocitat.y) < 1:
			punts = 10
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_shift"):
		velocitat.x = velocitatmaxima
		if abs(velocitat.y) > 1 and contador == 0:
			punts = 0
		elif abs(velocitat.y) > 1 and contador == 1:
			punts = 5
		elif abs(velocitat.y) < 1:
			punts = 20
	if Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatpocapoc
		if abs(velocitat.y) > 1 and contador == 0:
			punts = 0
		elif abs(velocitat.y) > 1 and contador == 1:
			punts = 5
		elif abs(velocitat.y) < 1:
			punts = 10
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_shift"):
		velocitat.x = -velocitatmaxima
		if abs(velocitat.y) > 1 and contador == 0:
			punts = 0
		elif abs(velocitat.y) > 1 and contador == 1:
			punts = 5
		elif abs(velocitat.y) < 1:
			punts = 20
	if Input.is_action_just_pressed("ui_up") and  abs(velocitat.y) < 1 and contador == 1:
		velocitat += salt
		punts = 0
		contador = 0
	if not is_on_floor():
		velocitat += gravetat
		if Input.is_action_just_pressed("ui_up") and contador == 0:
			velocitat.y = 0
			velocitat += salt
			punts = 5
			contador = 1
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
	print(contador)
func anima():
	if velocitat.x < 0:
		$Sprite.flip_h = true
	elif velocitat.x > 0:
		$Sprite.flip_h = false
	if punts == 10:
		$AnimationPlayer.play("Camina")
	elif punts == 20:
		$AnimationPlayer.play("Corre")
	elif punts == 1000:
		$AnimationPlayer.play("Quiet")
	elif punts == 0 and abs(velocitat.y) > 1:
		$AnimationPlayer.play("Salta")
	elif punts == 5:
		$AnimationPlayer.play("DobleSalt")
		
func mor():
	queue_free()
	get_tree().reload_current_scene()



func _on_Area2D_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()
