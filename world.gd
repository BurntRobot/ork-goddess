extends Node

@onready var orks_counter = $UI/OrksCounter
@onready var goddess = $MainGame/Goddess
@onready var units = $MainGame/Units
var zoom = 0

func _process(delta):
	# позже заменить на сигнал при изменении зума
	if zoom != goddess.zoom.x:
		zoom = goddess.zoom.x
		units.set_multiplier(zoom)

func _on_units_orks_counted(orks_number):
	if orks_counter:
		orks_counter.text = "Orks: " + str(orks_number)
