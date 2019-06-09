extends Node2D
var vida_planta = 100
var llista_nums_random = []
var llista_posicions = []
var morts = 0

var posicio_1 = Vector2(0,0) #Superior dreta
var posicio_2 = Vector2(-31,498)
var posicio_3 = Vector2(1130,41)
var posicio_4 = Vector2(1127,522)
var posicio_5 = Vector2(1131,339)
var posicio_6 = Vector2(-29,320)

func _ready():
	print("start")
	$Fons/CenterContainer/Label.visible = false
	genera_llista()
	crea_llista_posicions(llista_nums_random)
	$Enemic1.position = llista_posicions[0]

func _process(delta):
	barra_vida_planta()
	if vida_planta == 0:
		print("hola")
		$Fons/CenterContainer/Label.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func crea_llista_posicions(llista):
	for numero in llista_nums_random:
		if numero == 1:
			llista_posicions.append(posicio_1)
		if numero == 2:
			llista_posicions.append(posicio_2)
		if numero == 3:
			llista_posicions.append(posicio_3)
		if numero == 4:
			llista_posicions.append(posicio_4)
		if numero == 5:
			llista_posicions.append(posicio_5)
		if numero == 6:
			llista_posicions.append(posicio_6)
	print(llista_posicions)

func barra_vida_planta():
	if vida_planta == 100:
		$Vida_planta/TextureProgress.value = 100
	if vida_planta == 75:
		$Vida_planta/TextureProgress.value = 65
	if vida_planta == 50:
		$Vida_planta/TextureProgress.value = 50
	if vida_planta == 25:
		$Vida_planta/TextureProgress.value = 40
	if vida_planta == 0:
		$Vida_planta/TextureProgress.value = 0

func genera_llista(): #Quan crides aquesta funció et dona un numero aleatori
	while len(llista_nums_random)<6:
		llista_nums_random.append(randi()%(6)+(1))
		print(llista_nums_random)
		
func _on_Enemic1_body_entered(body):
	print("tocat")
	$Enemic1.queue_free()


func _on_Flor_body_entered(body):
	print("enemic dins flor")
	vida_planta -= 25
	morts = morts + 1
	$Enemic1.position = llista_posicions[0 + morts]