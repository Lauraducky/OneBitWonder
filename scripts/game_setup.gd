
extends Node2D

var grid
var is_setup = false

func _ready():
	set_process_input(true)

func _input(event):
	if(!is_setup):
		return
	
	if (Input.is_action_pressed("up")):
		grid.up()
	elif (Input.is_action_pressed("down")):
		pass
	elif (Input.is_action_pressed("left")):
		pass
	elif (Input.is_action_pressed("right")):
		pass

func setup():
	
	is_setup = true
