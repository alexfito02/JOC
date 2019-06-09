extends KinematicBody2D
var final = false
var pasos = 0
var llista_posicions = []
var planta_pos = Vector2(557,434)
var direccio = Vector2()

var posicio_1 = Vector2(0,0) #Superior dreta
var posicio_2 = Vector2(-31,498)
var posicio_3 = Vector2(1130,41)
var posicio_4 = Vector2(1127,522)
var posicio_5 = Vector2(1131,339)
var posicio_6 = Vector2(-29,320)

#warning-ignore:unused_argument
func _physics_process(delta):
		if final == true:
			pasos = pasos + 1
			final = false
		mou()
	
func mou():
	direccio = planta_pos - position
	direccio.normalized()
	move_and_slide(direccio)
