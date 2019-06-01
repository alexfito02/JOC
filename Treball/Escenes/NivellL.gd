extends Node2D
var vida_planta = 100
var numero = 0
var nums_usats = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func num_random(primer, segon): #Quan crides aquesta funció et dona un numero aleatori
	numero = randi()%(segon+1)+(primer) #Cal que el primer numero sigui el petit i el segon el gran
	nums_usats.append(numero)
	print(numero)
	print(nums_usats)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Fons/CenterContainer/Label.visible = false
	print("comança")

func _process(delta):
	num_random(1,10)
	barra_vida_planta()
	if vida_planta == 0:
		print("hola")
		$Fons/CenterContainer/Label.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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


func _on_Enemic1_body_entered(body):
	$Enemic1.queue_free()


func _on_Flor_body_entered(body):
	print("enemic dins flor")
	vida_planta -= 25
	if body == $Enemic1/enemic:
		$Enemic1.queue_free()
	if body == $Enemic2/enemic2:
		$Enemic2.queue_free()
	if body == $Enemic3/enemic3:
		$Enemic3.queue_free()
	if body == $Enemic4/enemic4:
		$Enemic4.queue_free()
