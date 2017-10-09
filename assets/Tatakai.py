import pyglet
from pyglet.gl import glViewport, glMatrixMode, glOrtho, glLoadIdentity, glScalef
from pyglet.gl import GL_PROJECTION, GL_MODELVIEW


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

if __name__ == "__main__":
    load_configuration()
    set_scene(0)

##Schedulers for scene change, aspect enforce, and main display cycle.##
    pyglet.clock.schedule_interval(set_scene, 3.0)
    pyglet.clock.schedule_interval(enforce_aspect_ratio, 0.3)
    pyglet.clock.schedule_interval(lambda dt: None, 1/60.0)
    pyglet.app.run()
