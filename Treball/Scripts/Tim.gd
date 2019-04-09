extends KinematicBody2D
var velocitatmaxima = 100
var velocitat = Vector2()
func _process(delta):
	mou()
	anima()

func mou():
	velocitat = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2(1,0)
		
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2(-1, 0)
	velocitat = velocitat * velocitatmaxima
	move_and_slide(velocitat)

func anima():
	if velocitat.x > 0:
		$AnimatedSprite.animation = "Camina"
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0:
		$AnimatedSprite.animation = "Camina"
		$AnimatedSprite.flip_h = true
	else:
		velocitat = Vector2()
		$AnimatedSprite.animation = "Quiet"