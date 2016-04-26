
extends Node2D

var grid
var is_setup = false
var curr_speed = 1.0
var exiting = false

var c0 = Color(1,0,1,0.7)
var c1 = Color(1,0,0,0.7)

var grid_template = preload("res://scenes/grid.scn")

#node refs
var background
var exit_timer

func _ready():
	set_process_input(true)
	background = get_node("background")
	exit_timer = get_node("exit_timer")
	setup("res://levels/level0.txt")

func _input(event):
	if(!is_setup || event.is_echo()):
		return
	
	if(event.is_action("exit")):
		if(event.is_pressed()):
			exiting = true
			exit_timer.start()
		else:
			exiting = false
			exit_timer.stop()
	
	if(!event.is_pressed()):
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
	set_colour(grid.get_selected().selection())

func _on_display_timer_timeout():
	if(!is_setup):
		return
	var colour = grid.next()
	set_colour(colour)

func set_colour(colour):
	if (colour == 0):
		background.change_colour(c0)
	else:
		background.change_colour(c1)

func _on_exit_timer_timeout():
	if(exiting):
		#TODO: quit to menu
		print("exit")
