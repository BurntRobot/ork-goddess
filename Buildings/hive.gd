extends StaticBody2D

var project = true
var chosen = false
@onready var collision = $CollisionShape2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	if project:
		position = get_global_mouse_position()
	if Input.is_action_pressed("mouse_select"):
		collision.disabled = false
		project = false
