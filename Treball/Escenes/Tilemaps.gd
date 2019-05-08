extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	$Nivell/Control/CanvasLayer/Menu.popup_centered()
	get_tree().paused = true
	



func _on_Resume_pressed():
	pass # Replace with function body.


func _on_Restart_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	pass # Replace with function body.
