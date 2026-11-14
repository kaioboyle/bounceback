xtends KinematicBody2D
signal dragsignal
export var speed = 500

var start = null

var end = null

var direction = Vector2()

var dragging = false

var radius = 32

func _ready(): connect("dragsignal",self,"setDrag")

func setDrag(): dragging =! dragging

if(start != null and end != null): direction = -start.direction_to(end)

func _input(event):

if event is InputEventMouseButton:

if event.button_index == BUTTON_LEFT and event.pressed and (event.position - self.position).length() < radius:

start = event.position emit_signal("dragsignal")

elif event.button_index == BUTTON_LEFT and !event.pressed and dragging == true:

end = event.position emit_signal("dragsignal")

func _physics_process(delta):

var c = move_and_collide(directiondeltaspeed)
if c:
direction = direction.bounce(c.normal) 
