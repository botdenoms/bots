extends CanvasLayer

onready var menu = $menu
onready var menu_icon = $overlays/appbar/menu
onready var code = $overlays/actionbar/code
onready var editor = $editor

# preloaded textures
onready var open = preload("res://arts/ui/menu.png")
onready var close = preload("res://arts/ui/close.png")

var menu_open = false
var editor_open = false

func _ready():
	ui_update()

func ui_update():
	menu.visible = menu_open
	if menu_open:
		menu_icon.icon = close
		code.visible = false
	else:
		menu_icon.icon = open
		code.visible = true
	if editor_open:
		editor.visible = true
		code.visible = false
	else:
		editor.visible = false
		code.visible = true

func _on_menu_pressed():
	menu_open = !menu_open
	ui_update()

func _on_code_pressed():
	editor_open = !editor_open
	ui_update()
