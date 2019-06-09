extends KinematicBody2D
var velocitat = Vector2()
var velocitat_max = 1.5
var moure = true
var llista_posicions = []
var planta_pos = Vector2(557,434)
var direccio = Vector2()

var posicio_1 = Vector2(0,0) #Superior dreta
var posicio_2 = Vector2(-31,498)
var posicio_3 = Vector2(1130,41)
var posicio_4 = Vector2(1127,522)
var posicio_5 = Vector2(1131,339)
var posicio_6 = Vector2(-29,320)

func genera_llista(): #Quan crides aquesta funció et dona un numero aleatori
	while len(llista_posicions)<6:
		llista_posicions.append(randi()%(6)+(1))
		print(llista_posicions)

func _ready():
	genera_llista()

#warning-ignore:unused_argument
func _physics_process(delta):
	if moure == true:
		mou()
	
func mou():
	if len(llista_posicions) == 0:
		pass
	else:
		if llista_posicions[0] == 1:
			pass
		if llista_posicions[0] == 2:
			pass
		if llista_posicions[0] == 3:
			pass
		if llista_posicions[0] == 4:
			pass
		if llista_posicions[0] == 5:
			pass
		if llista_posicions[0] == 6:
			pass
		direccio = planta_pos - posicio_1
		direccio.normalized()
		move_and_slide(direccio)

	#velocitat.x = 1
	#velocitat.y = 1
	#velocitat = velocitat.normalized()
	#position = position + velocitat*velocitat_max
