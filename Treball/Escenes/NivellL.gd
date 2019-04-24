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
	if vida_planta == 0:
		print("hola")
		$Fons/CenterContainer/Label.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area): #Aquesta s'activa quan entren l'area de la flor
	print("enemic dins flor")
	vida_planta -= 25


func _on_Area2D_body_entered(body):
	print("enemic dins flor")
	vida_planta -= 25
	$Enemic.position = Vector2(155,130)
