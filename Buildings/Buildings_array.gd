extends Node2D

var hive_scene = preload("res://Buildings/hive.tscn")

func build_a(building_name):
	var hive = hive_scene.instantiate()
	add_child(hive)
