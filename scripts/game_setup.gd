
extends Node2D

var grid
var is_setup = true
var is_pressed = false

func _ready():
	set_process_input(true)

func _input(event):
	if(!is_setup || event.is_echo() || !event.is_pressed()):
		return
	
	if (event.is_action("up")):
		print("up")
	elif (event.is_action("down")):
		print("down")
	elif (event.is_action("left")):
		print("left")
	elif (event.is_action("right")):
		print("right")

func setup():
	
	is_setup = true
