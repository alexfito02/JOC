extends KinematicBody2D
var velocitatpocapoc = 150
var velocitatmaxima = 250
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
var punts = 0
func _physics_process(delta):
	mou()
	
func _process(delta):
	anima()
	if position.y > 1000:
		mor()

func mou():
	velocitat.x = 0
	if velocitat.x == 0 and velocitat.y == 0:
		punts = 1000
	if Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatpocapoc
		punts = 10
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_shift"):
		velocitat.x = velocitatmaxima
		punts = 20
	if Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatpocapoc
		punts = 10
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_shift"):
		velocitat.x = -velocitatmaxima
		punts = 20
	if Input.is_action_just_pressed("ui_up") and  is_on_floor():
		velocitat += salt
		punts = 0
	if not is_on_floor():
		velocitat += gravetat
		if punts == 0 and Input.is_action_just_pressed("ui_up"):
			velocitat += salt
			punts = 5
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
	
	
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
	elif punts == 0:
		$AnimationPlayer.play("Salta")
	elif punts == 5:
		#$AnimationPlayer.play("DobleSalt")
		pass
		
func mor():
	queue_free()
	get_tree().reload_current_scene()



func _on_Area2D_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()
