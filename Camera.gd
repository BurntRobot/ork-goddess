extends Camera2D

@onready var zoom_tween = create_tween()

var min_zoom = 0.1
var max_zoom = 0.75
var zoom_step = 0.05
var zoom_acceleration = 0.005
var zoom_speed = 0
var zoom_threshold = 0.05
var camera_speed = 20

var input_direction = Vector2.ZERO


func _process(delta):
	_get_input_direction()
	position += input_direction * camera_speed
	if zoom.x < (max_zoom-zoom_threshold) and zoom.x > (min_zoom+zoom_threshold):
		if zoom_speed > 0:
			zoom.x += zoom_speed
			zoom.y += zoom_speed
		elif zoom_speed < 0:
			zoom.x -= zoom_speed
			zoom.y -= zoom_speed
	elif zoom.x >= (max_zoom-zoom_threshold):
		if zoom_speed > 0 and zoom.x < max_zoom:
			zoom_speed = 0
			print("here")
			zoom_tween.tween_property(self, "zoom", Vector2(max_zoom, max_zoom), 1)
			await get_tree().create_timer(1).timeout
		elif zoom_speed < 0:
			zoom.x -= zoom_speed
			zoom.y -= zoom_speed
	elif zoom.x <= (min_zoom+zoom_threshold):
		if zoom_speed < 0 and zoom.x > max_zoom:
			zoom_speed = 0
			print("here")
			zoom_tween.tween_property(self, "zoom", Vector2(min_zoom, min_zoom), 1)
			await get_tree().create_timer(1).timeout
		elif zoom_speed > 0:
			zoom.x += zoom_speed
			zoom.y += zoom_speed

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
