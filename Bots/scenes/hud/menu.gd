extends CanvasLayer

signal close(value)

func _on_resume_pressed():
	emit_signal("close", false)

func _on_restart_pressed():
	emit_signal("close", true)

func _on_settings_pressed():
	print('Working on it!!')

func _on_exit_pressed():
	print('Working on it!!')
