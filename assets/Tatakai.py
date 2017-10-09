import pyglet
from pyglet.gl import glViewport, glMatrixMode, glOrtho, glLoadIdentity, glScalef
from pyglet.gl import GL_PROJECTION, GL_MODELVIEW
from configparser import ConfigParser

##Main scene.##
pyglet.resource.path.append("theme")
pyglet.resource.reindex()
window = pyglet.window.Window(width=1280, height=720,
                              caption="Tatakai",
                              resizable=True, vsync=True)
window.set_icon(pyglet.resource.image("icon.png"))
config = ConfigParser()

@window.event
def on_resize(width, height):
    glViewport(0, 0, width, height)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0, width, 0, height, -1, 1)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    scale_x = width / 1280.0
    scale_y = height / 720.0
    glScalef(scale_x, scale_y, 1.0)

class MainScene:
    def __init__(self, window_instance, fightstick):
        self.window = window_instance
        self.batch = pyglet.graphics.Batch()


##Enforce aspect ratio by readjusting the window height.##
def enforce_aspect_ratio(dt):
    aspect_ratio = 1.641025641
    target_width = int(window.height * aspect_ratio)
    target_height = int(window.width / aspect_ratio)

    if window.width != target_width and window.height != target_height:
        window.set_size(window.width, target_height)


if __name__ == "__main__":
    load_configuration()
    set_scene(0)

##Schedulers for scene change, aspect enforce, and main display cycle.##
    pyglet.clock.schedule_interval(set_scene, 3.0)
    pyglet.clock.schedule_interval(enforce_aspect_ratio, 0.3)
    pyglet.clock.schedule_interval(lambda dt: None, 1/60.0)
    pyglet.app.run()
