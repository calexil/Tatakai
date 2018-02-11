extends Control

export (PackedScene) var next_scene
var next_scene_instance = null

#Loading Thread
onready var loading_thread = Thread.new()

func _ready():
	#Load data
	loading_thread.start(self, "load_data")

	#Display splash
	splash_screen()

func splash_screen():
	print("Load Splash screen")


	# Create instance
	next_scene_instance = next_scene.instance()

	#add to scene
	add_child(next_scene_instance)

func load_data(vars):
	for i in range(0, 900000):
		for j in range(0, 7):
			pass

	print("Load Complete")
	next_scene_instance.is_loading =false
	pass