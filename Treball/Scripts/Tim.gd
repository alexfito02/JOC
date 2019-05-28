extends KinematicBody2D
var velocitatpocapoc = 250
var velocitatmaxima = 400
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
var animacio = 1000
func _physics_process(delta):
	mou()
	
func _process(delta):
	anima()
	if position.y > 1000:
		mor()

func mou():
	velocitat.x = 0
	if velocitat.x == 0 and abs(velocitat.y) <= 1 and is_on_floor():
		animacio = 1000
	if Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatpocapoc
		if abs(velocitat.y) >= 1:
			animacio = 0
		elif abs(velocitat.y) < 1:
			animacio = 10
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_shift"):
		velocitat.x = velocitatmaxima
		if abs(velocitat.y) >= 1:
			animacio = 0
		elif abs(velocitat.y) < 1:
			animacio = 20
	if Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatpocapoc
		if abs(velocitat.y) >= 1:
			animacio = 0
		elif abs(velocitat.y) < 1:
			animacio = 10
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_shift"):
		velocitat.x = -velocitatmaxima
		if abs(velocitat.y) >= 1:
			animacio = 0
		elif abs(velocitat.y) < 1:
			animacio = 20
	if Input.is_action_just_pressed("ui_up") and abs(velocitat.y) <= 1:
		velocitat += salt
		animacio = 0
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
func anima():
	if velocitat.x < 0:
		$Sprite.flip_h = true
	elif velocitat.x > 0:
		$Sprite.flip_h = false
	if animacio == 10:
		$AnimationPlayer.play("Camina")
	elif animacio == 20:
		$AnimationPlayer.play("Corre")
	elif animacio == 1000:
		$AnimationPlayer.play("Quiet")
	elif animacio == 0 and abs(velocitat.y) > 1:
		$AnimationPlayer.play("Salta")
func mor():
	queue_free()
	get_tree().reload_current_scene()



func _on_Area2D_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()
