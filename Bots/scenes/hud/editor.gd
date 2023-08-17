extends CanvasLayer

var _code = []
var _commands = ['Forward', 'Left', 'Right', 'Backward']

onready var cmd_ui = preload("res://scenes/hud/cmd.tscn")
onready var line_ui = preload("res://scenes/hud/line.tscn")

onready var cmd_list = $VBoxContainer/MarginContainer/ColorRect/VBoxContainer/commands/list
onready var lines = $VBoxContainer/MarginContainer/ColorRect/VBoxContainer/code/lines

signal run(code)

func _ready():
	build_commands()
	build_code()

func build_commands():
	for cmd in _commands:
		var i = cmd_ui.instance()
		i.call('init_cmd', cmd)
		i.connect("command", self, "_add_command")
		cmd_list.add_child(i)
		#i.queue_free()

func build_code():
	for c in lines.get_children():
		c.queue_free()
	for ln in _code:
		var i = line_ui.instance()
		i.call('init_line', ln)
		i.connect("del", self, "del_line")
		i.connect("modify_count", self, "units_update")
		#i.connect("command", self, "_add_command")
		lines.add_child(i)
		#i.queue_free()

func _add_command(command):
	# if comd == last : icrease qty
	if not _code.empty() and _code[len(_code) - 1]['command'] == command:
		_code[len(_code) - 1]['units'] += 1
		build_code()
		return
	var line = {}
	line['no'] = len(_code) + 1
	line['command'] = command
	line['units'] = 1
	# add comd to coded list
	_code.append(line)
	build_code()

func units_update(index, value):
	_code[index]['units'] = value
	build_code()

func del_line(index):
	_code.remove(index)
	var tmp = []
	var i = 1
	for l in _code:
		var line = {}
		line['no'] = i 
		line['command'] = l['command']
		line['units'] = l['units']
		tmp.append(line)
		i += 1
	_code.clear()
	_code = tmp
	build_code()

func _on_run_pressed():
	emit_signal("run", [])
