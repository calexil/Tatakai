extends Control

onready var warn = get_node("warn")
var main_menu_screen = preload("res://data/screens/menu.tscn")

func _ready():
	fade_in_out()

func _input(event):
	if(Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_ENTER) || Input.is_mouse_button_pressed(BUTTON_LEFT)):
		display_main_menu()

func fade_in_out():
	warn.play("warnanimate")

func display_main_menu():
	print("Switching to main menu screen")
	#Add warning screen to scene tree
	get_tree().get_root().add_child(main_menu_screen.instance())
	#Remove splash screen from scene tree
	queue_free()

func _on_warn_animation_finished( anim_name ):
	display_main_menu()