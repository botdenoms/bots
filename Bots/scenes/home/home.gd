extends Control

# state variables
var level = 1
var difficulty = 1
var custom = true

# ui elements selectors
onready var level_label = $ColorRect/VBoxContainer/levelscontrol/level
onready var basic = $ColorRect/VBoxContainer/difiicultycontrol/basic
onready var average = $ColorRect/VBoxContainer/difiicultycontrol/average
onready var advanced = $ColorRect/VBoxContainer/difiicultycontrol/advanced
onready var expert = $ColorRect/VBoxContainer/difiicultycontrol/expert
onready var legendary = $ColorRect/VBoxContainer/difiicultycontrol/legendary
onready var custom_btn = $ColorRect/VBoxContainer/modebar/custom
onready var procedural_btn = $ColorRect/VBoxContainer/modebar/precedural

# preloaded textures
onready var active = preload("res://arts/ui/activestars.png")
onready var inactive = preload("res://arts/ui/inactivestar.png")

func _ready():
	# read persistent information
	# inialize ui
	difficulty_update()
	pass

func _exit_tree():
	# write persistent information
	pass

func ui_update():
	level_label.text = str(level)
	if custom:
		custom_btn.material.set("shader_param/active", true)
		procedural_btn.material.set("shader_param/active", false)
	else:
		custom_btn.material.set("shader_param/active", false)
		procedural_btn.material.set("shader_param/active", true)

func difficulty_update():
	# updates difficulty ui
	match difficulty:
		1:
			basic.icon = active
			average.icon = inactive
			advanced.icon = inactive
			expert.icon = inactive
			legendary.icon = inactive
		2:
			basic.icon = active
			average.icon = active
			advanced.icon = inactive
			expert.icon = inactive
			legendary.icon = inactive
		3:
			basic.icon = active
			average.icon = active
			advanced.icon = active
			expert.icon = inactive
			legendary.icon = inactive
		4:
			basic.icon = active
			average.icon = active
			advanced.icon = active
			expert.icon = active
			legendary.icon = inactive
		5:
			basic.icon = active
			average.icon = active
			advanced.icon = active
			expert.icon = active
			legendary.icon = active

func _on_custom_pressed():
	custom = true
	ui_update()

func _on_precedural_pressed():
	custom = false
	ui_update()

func _on_prev_pressed():
	level -= 1
	ui_update()

func _on_next_pressed():
	level += 1
	ui_update()

func _on_basic_pressed():
	difficulty = 1
	difficulty_update()

func _on_average_pressed():
	difficulty = 2
	difficulty_update()

func _on_advanced_pressed():
	difficulty = 3
	difficulty_update()

func _on_expert_pressed():
	difficulty = 4
	difficulty_update()

func _on_legendary_pressed():
	difficulty = 5
	difficulty_update()

func _on_help_pressed():
	pass # Replace with function body.

func _on_run_pressed():
	print('Custom  mode:', custom, 'level :', level)
	pass # Replace with function body.
