extends KinematicBody2D
var velocitatpocapoc = 150
var velocitatmaxima = 250
var velocitat_salt = 600
var velocitat = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	mou()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func mou():
	velocitat.x = 0
	if Input.is_action_pressed("tecla_d"):
		velocitat.x = velocitatpocapoc
	if Input.is_action_pressed("tecla_A"):
		velocitat.x = -velocitatpocapoc
	if Input.is_action_pressed("tecla_S"):
		velocitat.y = 100
	elif Input.is_action_pressed("tecla_w"):
		velocitat.y = -100
	else:
		velocitat.y = 0
	velocitat = move_and_slide(velocitat, Vector2(0,-1))
