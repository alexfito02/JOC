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
	mostra_menu()
	
func mostra_menu():
	$Control/CanvasLayer/Menu.popup_centered()
	get_tree().paused = true


func _on_Resume_pressed():
	print("resume")
	$Control/CanvasLayer/Menu.hide()
	get_tree().paused = false

func _on_Restart_pressed():
	print("restart")
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Exit_pressed():
		print("Exit")
	
	
func menu_esc():
	if Input.is_action_just_pressed("esc"):
		mostra_menu()
	
