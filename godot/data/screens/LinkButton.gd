extends LinkButton


func ready():
	set_process_input(true)

func mouse_click():
	if mouseclick(true):
		OS.shell_open("https://github.com/calexil/Tatakai")
