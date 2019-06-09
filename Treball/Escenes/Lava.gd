extends Area2D

var velocitat = Vector2(3.8,0)

func _process(delta):
	mou_lava()

func mou_lava():
	position = position + velocitat


