extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Nivell_Tilemaps_pressed():
	print("Nivell Tilemaps")
	get_tree().change_scene("res://Escenes/Tilemaps.tscn")
	


func _on_Nivell_2_pressed():
	print("Nivell 2")
	get_tree().change_scene("res://Escenes/NivellL.tscn")
