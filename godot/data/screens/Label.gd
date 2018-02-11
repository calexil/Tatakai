#extends Label
#
#func _ready():
#  get_node(Label).connect("input_event", self, "label_pressed");
#func label_pressed(input_event):
#	if (input_event.type == input_event.MOUSE_BUTTON):
#		var link_button_size = get_node(Label).get_size();
#		var link_button_pos = get_node(Label).get_global_pos();
#		var mouse_pos = get_global_mouse_pos();
#		OS.shell_open("http://godotengine.org");
#
#