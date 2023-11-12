extends TextureRect

var in_building = false
var zoom_multiplier = 0

func _process(delta):
	scale = Vector2(zoom_multiplier, zoom_multiplier)
	position = get_global_mouse_position() - (texture.get_size() * scale / 2)

func _unhandled_input(event):
	if event is InputEventMouseButton and in_building:
		if event.is_action_pressed("mouse_select"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			visible = false
			in_building = false

func _on_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	visible = true
	in_building = true

func set_multiplier(_zoom_multiplier):
	zoom_multiplier = _zoom_multiplier
