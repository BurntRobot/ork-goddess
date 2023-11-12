extends Node2D

var orks_number
signal orks_counted(orks_number)

func _process(_delta):
	var new_orks_number = get_child_count()
	if new_orks_number != orks_number:
		orks_number = new_orks_number
		emit_signal("orks_counted", orks_number)

func _on_selection_area_selection_cleared():
	for unit in get_children():
		unit.chosen = false

func set_multiplier(zoom_multiplier):
	for unit in get_children():
		unit.zoom_multiplier = zoom_multiplier
