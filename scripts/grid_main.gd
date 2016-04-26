
extends Node2D

var gears = []
var selection
var display = 0

var gear_template = preload("res://scenes/gear.scn")

func _ready():
	pass

func setup(src_file):
	var file = File.new()
	file.open(src_file, File.READ)
	
	while(!file.eof_reached()):
		var line = file.get_line()
		var numbers = line.split(" ")
		var gear = gear_template.instance()
		gear.setup(int(numbers[0]), int(numbers[1]))
		add_child(gear)
		gears.append(gear)
	file.close()
	
	selection = 0

func next():
	display += 1
	if(display >= gears.size()):
		display = 0
	return gears[display].selection()

func get_selected():
	return gears[selection]

func left():
	selection -= 1
	if (selection < 0):
		selection = gears.size() - 1

func right():
	selection += 1
	if(selection >= gears.size()):
		selection = 0

func up():
	gears[selection].up()

func down():
	gears[selection].down()

func is_solved():
	for gear in gears:
		if gear.selection() == 1:
			return false
	return true

