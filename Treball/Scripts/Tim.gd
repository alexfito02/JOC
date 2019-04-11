extends KinematicBody2D
var velocitatmaxima = 200
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
func _process(delta):
	mou()
	anima()

func mou():
	velocitat.x = 0
	if Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatmaxima
		
	if Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatmaxima
		
	if Input.is_action_pressed("ui_up") and  is_on_floor():
		velocitat += salt
	
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat, Vector2(0,-1))

func anima():
	if velocitat.x > 0:
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = false
	elif velocitat.x < 0:
		$AnimationPlayer.play("Camina")
		$Sprite.flip_h = true
	else:
		$AnimationPlayer.play("Quiet")
