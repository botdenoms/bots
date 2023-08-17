extends Button

var _data = null

signal command(data)

func _ready():
	pass # Replace with function body.

func init_cmd(data):
	_data = data
	text = str(data)

func _on_cmd_pressed():
	emit_signal("command", _data)
