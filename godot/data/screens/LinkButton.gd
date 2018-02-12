extends LinkButton

onready var linkbutton = get_node("linkbutton")
#
#func mouseclick():
#	linkbutton.connect("finished", self, "open_link")

func open_link():
	if linkbutton.is_pressed():
		OS.shell_open("https://github.com/calexil/Tatakai")
