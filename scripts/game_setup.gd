
extends Node2D

var grid
var is_setup = false

var c0
var c1

var grid_template = preload("res://scenes/grid.scn")

func _ready():
	set_process_input(true)
	setup("res://levels/level0.txt")

func _input(event):
	if(!is_setup || event.is_echo() || !event.is_pressed()):
		return
	
	if (event.is_action("up")):
		grid.up()
	elif (event.is_action("down")):
		grid.down()
	elif (event.is_action("left")):
		grid.left()
	elif (event.is_action("right")):
		grid.right()
	elif (event.is_action("speed_up")):
		print("up")
	elif (event.is_action("speed_down")):
		print("down")
	
	if (grid.is_solved()):
		print("solved")

func setup(src_file):
	grid = grid_template.instance()
	grid.setup(src_file)
	add_child(grid)
	is_setup = true

func _on_display_timer_timeout():
	if(!is_setup):
		return
	var colour = grid.next()
	print(colour)
