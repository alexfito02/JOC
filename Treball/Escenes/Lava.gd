extends StaticBody2D

var velocitat = Vector2(1,0)

func _process(delta):
	mou_lava()

func mou_lava():
	position = position + velocitat

