extends Control

var splash_screen = preload("res://data/screens/Splash.tscn")
#var next_scene_instance = null
#var is_loading = true

#Loading Thread
onready var loading_thread = Thread.new()

func _ready():
	#Load data
	loading_thread.start(self, "load_data")
	#Display splash
	initiate_splash()

func initiate_splash():
	print("Initiating splash screen sequence")
	add_child(splash_screen.instance())

#Placeholder function for loading game resources. If many resources need to be loaded, consider using
#Interactive ResourceLoader to display a progress bar
func load_data(vars):
	#for i in range(0, 900000):
	#	for j in range(0, 7):
	#		pass
	print("Load Complete")
	#next_scene_instance.is_loading =false
