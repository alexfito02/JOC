extends KinematicBody2D
var final = false
var pasos = 0
var llista_posicions = []
var planta_pos = Vector2(557,434)
var direccio = Vector2()

#warning-ignore:unused_argument
func _physics_process(delta):
		if final == true:
			pasos = pasos + 1
			final = false
		mou()
	
func mou():
	direccio = planta_pos - position
	direccio.normalized()
	move_and_slide(direccio, Vector2(0.5, 0.5))