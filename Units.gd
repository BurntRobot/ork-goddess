extends Node2D

func _on_selection_area_selection_cleared():
	for unit in get_children():
		unit.chosen = false
