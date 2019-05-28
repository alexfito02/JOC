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
	$Control/CanvasLayer/Menu.hide()
	get_tree().paused = false

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Exit_pressed():
	get_tree().change_scene("res://Escenes/2a Pantalla inicial.tscn")
	get_tree().paused = false
	
	
	
func menu_esc():
	if Input.is_action_just_pressed("esc"):
		mostra_menu()
	


func _on_Bandera_body_entered(body):
	get_tree().change_scene("res://Escenes/Pantalla you win.tscn")
	
