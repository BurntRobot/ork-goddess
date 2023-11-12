extends Area2D

@onready var col = $CollisionShape2D
@onready var mesh = $MeshInstance2D

var original_point = Vector2.ZERO
var starting_point = Vector2.ZERO
var ending_point = Vector2.ZERO
var in_action = false

signal selection_cleared

func _ready():
	original_point = position
	starting_point = position
	ending_point = position

func _process(_delta):
	if in_action:
		if position != starting_point:
			_reset_rect()
			position = starting_point
		ending_point = get_global_mouse_position()
		_set_rectagular()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_select"):
			in_action = true
			emit_signal("selection_cleared")
			starting_point = get_global_mouse_position()
		elif event.is_action_released("mouse_select"):
			in_action = false
			_reset_rect()

func _set_rectagular():
	_set_rectagular_shape()
	_set_rectagular_coords()

func _set_rectagular_shape():
	if ending_point.x > starting_point.x:
		_set_col_and_mesh_x(ending_point, starting_point)
	elif starting_point.x > ending_point.x:
		_set_col_and_mesh_x(starting_point, ending_point)
	if ending_point.y > starting_point.y:
		_set_col_and_mesh_y(ending_point, starting_point)
	elif starting_point.y > ending_point.y:
		_set_col_and_mesh_y(starting_point, ending_point)

func _set_rectagular_coords():
	position.x += (ending_point.x - starting_point.x) / 2
	position.y += (ending_point.y - starting_point.y) / 2

func _set_col_and_mesh_x(point1, point2):
	col.shape.size.x = point1.x - point2.x
	mesh.mesh.size.x = point1.x - point2.x

func _set_col_and_mesh_y(point1, point2):
	col.shape.size.y = point1.y - point2.y
	mesh.mesh.size.y = point1.y - point2.y

func _reset_rect():
	col.shape.size.x = 0
	mesh.mesh.size.x = 0
	col.shape.size.y = 0
	mesh.mesh.size.y = 0

func _on_body_entered(body):
	body.chosen = true
