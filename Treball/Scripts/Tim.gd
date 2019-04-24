extends KinematicBody2D
var velocitatpocapoc = 150
var velocitatmaxima = 250
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
func _process(delta):
	mou()
	anima()
	if position.y > 1000:
		mor()

func mou():
	velocitat.x = 0
	if Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatpocapoc
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_shift"):
		velocitat.x = velocitatmaxima
	if Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatpocapoc
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_shift"):
		velocitat.x = -velocitatmaxima
	if Input.is_action_pressed("ui_up") and  is_on_floor():
		velocitat += salt
	if Input.is_action_pressed("ui_control"):
		pass
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
	
func anima():
	if Input.is_action_pressed("ui_control"):
		$AnimationPlayer.play("Ajupirse")
	elif velocitat.x > 0 and velocitat.y == 0 and is_on_floor():
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = false
	elif velocitat.y  != 0:
		$AnimationPlayer.play("Salta")
		if velocitat.x > 0:
			$Sprite.flip_h = false
		elif velocitat.x < 0:
			$Sprite.flip_h = true
	if velocitat.x > velocitatpocapoc and velocitat.y == 0 and is_on_floor() and $AnimationPlayer.current_animation != "Corre":
		$AnimationPlayer.play("Corre")
		$Sprite.flip_h = false
	elif velocitat.x < 0 and velocitat.y == 0 and is_on_floor():
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = true
	if velocitat.x < -velocitatpocapoc and velocitat.y == 0 and is_on_floor() and $AnimationPlayer.current_animation != "Corre":
		$AnimationPlayer.play("Corre")
		$Sprite.flip_h = true
	elif velocitat.x < velocitatpocapoc and velocitat.x > -velocitatpocapoc and is_on_floor():
		$AnimationPlayer.play("Quiet")
	print($AnimationPlayer.current_animation)

func mor():
	queue_free()
	get_tree().reload_current_scene()