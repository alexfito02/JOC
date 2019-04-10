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
	if Input.is_action_pressed("ui_down"):
		print("abaix")
		vida_planta -= 25

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
