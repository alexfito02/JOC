extends KinematicBody2D
var velocitatpocapoc = 150
var velocitatmaxima = 250
var velocitat_salt = 600
var velocitat = Vector2()
var gravetat = Vector2(0,25)
var salt = Vector2(0,-velocitat_salt)
var velocitatajupit = 50

func _physics_process(delta):
	mou()
	
func _process(delta):
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
	if Input.is_action_pressed("ui_control") and is_on_floor() and Input.is_action_pressed("ui_right"):
		velocitat.x = velocitatajupit
		$AnimationPlayer.play("Ajupirse")
	if Input.is_action_pressed("ui_control") and is_on_floor() and Input.is_action_pressed("ui_left"):
		velocitat.x = -velocitatajupit
		$AnimationPlayer.play("Ajupirse")
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
	
	
func anima():
	if velocitat.x < 0:
		$Sprite.flip_h = true
	elif velocitat.x > 0:
		$Sprite.flip_h = false
	if is_on_floor():
		if abs(velocitat.x) == velocitatpocapoc:
			$AnimationPlayer.play("Camina")
		elif abs(velocitat.x) == velocitatmaxima:
			$AnimationPlayer.play("Corre")
		elif abs(velocitat.x) == 0:
			$AnimationPlayer.play("Quiet")
		else:
			pass
	elif abs(velocitat.y)  != 0:
		$AnimationPlayer.play("Salta")
func mor():
	queue_free()
	get_tree().reload_current_scene()



func _on_Area2D_body_entered(body):
	queue_free()
	get_tree().reload_current_scene()
