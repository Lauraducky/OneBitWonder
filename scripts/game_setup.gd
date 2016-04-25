
extends Node2D

var grid
var is_setup = true
var is_pressed = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(!is_setup):
		return
	
	if(is_pressed && Input.is_action_pressed("buttons")):
		return
	else:
		is_pressed = false
	
	
	if (Input.is_action_pressed("up")):
		print("up")
		is_pressed = true
	elif (Input.is_action_pressed("down")):
		print("down")
		is_pressed = true
	elif (Input.is_action_pressed("left")):
		print("left")
		is_pressed = true
	elif (Input.is_action_pressed("right")):
		print("right")
		is_pressed = true

func setup():
	
	is_setup = true
