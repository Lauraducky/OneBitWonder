
extends Node2D

var rotation
var faces = []

func _ready():
	pass

func setup(width, setting):
	faces = []
	rotation = setting
	
	for i in range(width - 1):
		faces.append(1)
	faces.append(0)

func selection():
	return faces[rotation]

func up():
	rotation += 1
	if (rotation >= faces.size()):
		rotation = 0

func down():
	rotation -= 1
	if (rotation < 0):
		rotation = faces.size() - 1
