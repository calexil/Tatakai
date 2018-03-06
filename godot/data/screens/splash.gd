extends Control

onready var splash = get_node("splash")
var warning_screen = preload("res://data/screens/warn.tscn")

func _ready():
	fade_in_out()

func _input(event):
	if(Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_ENTER) || Input.is_mouse_button_pressed(BUTTON_LEFT)):
		display_warning_screen()

func fade_in_out():
	splash.play("fadeinout")

func display_warning_screen():
	print("Switching to warning screen")
	#Add warning screen to scene tree
	get_tree().get_root().add_child(warning_screen.instance())
	#Remove splash screen from scene tree
	queue_free()

func _on_splash_animation_finished( anim_name ):
	display_warning_screen()