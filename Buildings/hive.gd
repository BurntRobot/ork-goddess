extends StaticBody2D

var project = true
var chosen = false
@onready var collision = $CollisionShape2D
@onready var main_sprite = $Sprite2D
@onready var used_area = $Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	if project:
		position = get_global_mouse_position()
		if used_area.get_overlapping_bodies().size() == 0:
			main_sprite.self_modulate = Color("ffffff64")
		else:
			main_sprite.self_modulate = Color("ff000064")
	if Input.is_action_pressed("mouse_select") and used_area.get_overlapping_bodies().size() == 0:
		collision.disabled = false
		project = false
		main_sprite.self_modulate = Color.WHITE
