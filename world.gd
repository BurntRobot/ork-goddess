extends Node

@onready var goddess = $MainGame/Goddess
@onready var units = $MainGame/Units
@onready var buildings = $MainGame/Buildings
@onready var ui = $UI
var zoom = 0

func _process(_delta):
	# позже заменить на сигнал при изменении зума
	if zoom != goddess.zoom.x:
		zoom = goddess.zoom.x
		units.set_multiplier(zoom)

func _on_units_orks_counted(orks_number):
	ui.set_orks_counter(orks_number)

func _on_building_placeholder_build(_texture):
	#buildings.
	#var node = ClassType.new()
	#node.set_name("node")
	#add_child(node)
	pass

func _on_ui_building_ploted(building_type):
	buildings.build_a(building_type)
