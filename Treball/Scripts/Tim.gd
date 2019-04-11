extends KinematicBody2D
var velocitatmaxima = 100
var velocitatpocapoc = 0
var velocitat = Vector2()
var gravetat = Vector2(0,9.8)
var salt = Vector2(0,-500)
func _process(delta):
	mou()
	anima()

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
	if velocitat.x > 0:
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = false
	elif velocitat.x > velocitatpocapoc:
		$AnimationPlayer.play("Corre")
		$Sprite.flip_h = false
	elif velocitat.x < 0:
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = true
	elif velocitat.x < velocitatpocapoc:
		$AnimationPlayer.play("Corre")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("ui_control"):
		$AnimationPlayer.play("Ajupirse")
	else:
		$AnimationPlayer.play("Quiet")
	