extends Area2D

@onready var col = $CollisionShape2D
@onready var mesh = $MeshInstance2D

var original_point = Vector2.ZERO
var starting_point = Vector2.ZERO
var ending_point = Vector2.ZERO
var in_action = false

func _ready():
	original_point = position
	starting_point = position
	ending_point = position

func _process(delta):
	if in_action:
		ending_point = get_global_mouse_position()
		_set_rectagular()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_select"):
			in_action = true
			starting_point = get_global_mouse_position()
		elif event.is_action_released("mouse_select"):
			in_action = false

func _set_rectagular():
	if ending_point.x > starting_point.x:
		_set_col_and_mesh_x(ending_point, starting_point)
	elif starting_point.x > ending_point.x:
		_set_col_and_mesh_x(starting_point, ending_point)
	if ending_point.y > starting_point.y:
		_set_col_and_mesh_y(ending_point, starting_point)
	elif starting_point.y > ending_point.y:
		_set_col_and_mesh_y(starting_point, ending_point)

func _set_col_and_mesh_x(point1, point2):
	col.shape.size.x = point1.x - point2.x
	mesh.mesh.size.x = point1.x - point2.x

func _set_col_and_mesh_y(point1, point2):
	col.shape.size.y = point1.y - point2.y
	mesh.mesh.size.y = point1.y - point2.y
