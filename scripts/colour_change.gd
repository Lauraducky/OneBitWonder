
extends Sprite

var colour = Color(255,255,255,0.7)

func _ready():
	update()

func _draw():
	draw_rect(Rect2(0,0,1500,1000), colour)

func change_colour(colour):
	self.colour = colour
	update()
