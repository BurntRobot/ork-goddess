extends Node

@onready var orks_counter = $UI/OrksCounter
@onready var goddess = $MainGame/Goddess
@onready var units = $MainGame/Units
@onready var building_placeholder = $UI/BuildingPlaceholder
@onready var buildings = $MainGame/Buildings
var zoom = 0

func _process(_delta):
	# позже заменить на сигнал при изменении зума
	if zoom != goddess.zoom.x:
		zoom = goddess.zoom.x
		units.set_multiplier(zoom)
		building_placeholder.set_multiplier(zoom)

func _on_units_orks_counted(orks_number):
	if orks_counter:
		orks_counter.text = "Orks: " + str(orks_number)

func _on_building_placeholder_build(_texture):
	#buildings.
	#var node = ClassType.new()
	#node.set_name("node")
	#add_child(node)
	pass
