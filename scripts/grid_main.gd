
extends Node2D

var gears = []
var selection
var display = 0

func _ready():
	pass

func next():
	display += 1
	if(display >= gears.size()):
		display = 0
	return gears[display].selection()

func get_selected():
	return gears[selected]

func left():
	pass

func right():
	pass

