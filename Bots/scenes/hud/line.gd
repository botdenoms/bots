extends ColorRect

var _data = null

signal modify_count(index, value)
signal del(index)

func _ready():
	pass # Replace with function body.

func init_line(data):
	_data = data
	update_ui()

func update_ui():
	$HBoxContainer/line.text = str(_data['no'])
	$HBoxContainer/command.text = _data['command']
	$HBoxContainer/units.text = '*' + str(_data['units'])

func _on_reduce_pressed():
	if _data['units'] == 1:
		return
	emit_signal("modify_count", _data['no'] - 1, _data['units'] - 1)

func _on_add_pressed():
	emit_signal("modify_count", _data['no'] - 1, _data['units'] + 1)

func _on_del_pressed():
	emit_signal("del", _data['no'] - 1)
