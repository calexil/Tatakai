extends Control

export (PackedScene) var next_scene

onready var splash = get_node("splash")

var is_loading = true

func ready():
	set_process_input(true)

	fade_in_out()

func _input(event):
	if(event.is_action_pressed("ui_select")):
		next_scene()

func fade_in_out():
	splash.play("fadeinout")
	splash.connect("finished", self, "goto_next_scene")

func goto_next_scene():
	if(is_loading):
		var timer = Timer.new()
		add_child(timer)
		timer.set_wait_time(1) # seconds
		timer.set_one_shot(false)
		timer.connect("timeout", self, "next_scene")
		timer.start()
	else:
		next_scene()

func next_scene():
	if(is_loading):
		print("loading the next scene")

		get_parent().add_child(next_scene.instance())
		queue_free()
	pass