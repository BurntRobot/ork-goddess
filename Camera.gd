extends Camera2D


var min_zoom = 0.5
var max_zoom = 2.0
var zoom_step = 0.05
var zoom_acceleration = 0.005
var zoom_speed = 0.0
var zoom_threshold = 0.05
var zoom_sliding = 0.005 / 50
var camera_speed = 10

var input_direction = Vector2.ZERO


func _process(delta):
	_move_camera()
	_zoom_camera()

func _move_camera():
	_get_input_direction()
	position += input_direction * camera_speed

func _zoom_camera():
	if zoom.x < (max_zoom - zoom_threshold) and zoom.x > (min_zoom + zoom_threshold):
		zoom.x += zoom_speed
		zoom.y += zoom_speed
	elif zoom.x >= (max_zoom - zoom_threshold):
		if zoom_speed > 0 and zoom.x < max_zoom:
			zoom_speed = 0
			print("here 2")
			zoom.move_toward(Vector2(max_zoom, max_zoom), zoom_step)
		elif zoom_speed < 0:
			zoom.x += zoom_speed
			zoom.y += zoom_speed
	elif zoom.x <= (min_zoom + zoom_threshold):
		if zoom_speed < 0 and zoom.x > min_zoom:
			zoom_speed = 0
			print("here 3")
			zoom.move_toward(Vector2(min_zoom, min_zoom), zoom_step)
		elif zoom_speed > 0:
			zoom.x += zoom_speed
			zoom.y += zoom_speed
	if zoom_speed > 0:
		zoom_speed -= zoom_sliding
	elif zoom_speed < 0:
		zoom_speed += zoom_sliding

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if zoom.x < max_zoom:
					zoom_speed += zoom_acceleration
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if zoom.x > min_zoom:
					zoom_speed -= zoom_acceleration

func _get_input_direction():
	input_direction = Input.get_vector("left", "right", "up", "down")
