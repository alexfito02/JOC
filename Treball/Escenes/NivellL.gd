extends Node2D
var vida_planta = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fons/CenterContainer/Label.visible = false
	print("comança")

func _process(delta):
	barra_vida_planta()
	if vida_planta == 0:
		print("hola")
		$Fons/CenterContainer/Label.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area): #Aquesta s'activa quan entren l'area de la flor
	print("enemic dins flor")
	vida_planta -= 25
	if area == $Enemic:
		$Enemic.position = Vector2(-155,-130)
		$Enemic.moure = false
	if area == $Enemic2:
		$Enemic2.position = Vector2(-155,-130)
		$Enemic2.moure = false
	if area == $Enemic3:
		$Enemic3.position = Vector2(-155,-130)
		$Enemic3.moure = false
	if area == $Enemic4:
		$Enemic4.position = Vector2(-155,-130)
		$Enemic4.moure = false

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

func _on_Area2D2_body_entered(body):
	if body == $Enemic1/enemic:
		$Enemic1.position = Vector2(-155,-130)
		$Enemic1.moure = false
	if body == $Enemic2/enemic2:
		$Enemic2.position = Vector2(-155,-130)
		$Enemic2.moure = false
	if body == $Enemic3/enemic3:
		$Enemic3.position = Vector2(-155,-130)
		$Enemic3.moure = false
	if body == $Enemic4/enemic4:
		$Enemic4.position = Vector2(-155,-130)
		$Enemic4.moure = false


func _on_Enemic1_body_entered(body):
	if body == $Protagonista:
		print("mort")


func _on_Flor_body_entered(body):
	print("enemic dins flor")
	vida_planta -= 25
	if body == $Enemic1:
		$Enemic1.position = Vector2(-155,-130)
		$Enemic1.moure = false
	if body == $Enemic2:
		$Enemic2.position = Vector2(-155,-130)
		$Enemic2.moure = false
	if body == $Enemic3:
		$Enemic3.position = Vector2(-155,-130)
		$Enemic3.moure = false
	if body == $Enemic4:
		$Enemic4.position = Vector2(-155,-130)
		$Enemic4.moure = false
