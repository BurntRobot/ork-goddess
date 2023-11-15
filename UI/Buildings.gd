extends Node

signal building_ploted(name)

func _on_hive_pressed():
	emit_signal("building_ploted", "hive")
