extends Camera2D

var min_zoom = Vector2(0.1, 0.1)
var max_zoom = Vector2(0.75, 0.75)
var zoom_step = Vector2(0.05, 0.05)
var camera_speed = 10

var input_direction = Vector2.ZERO


func _process(delta):
	_get_input_direction()
	position += input_direction * camera_speed

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if zoom < max_zoom:
					zoom += zoom_step
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if zoom > min_zoom:
					zoom -= zoom_step

func _get_input_direction():
	input_direction = Input.get_vector("left", "right", "up", "down")
