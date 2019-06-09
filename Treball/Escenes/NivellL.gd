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
	print("tocat")
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
