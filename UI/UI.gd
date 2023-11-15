extends CanvasLayer

@onready var buildings_panel = $Buildings
@onready var orks_counter = $OrksCounter

signal building_ploted(name)

func _on_build_button_pressed():
	if buildings_panel.visible:
		buildings_panel.visible = false
	else:
		buildings_panel.visible = true

func set_orks_counter(orks_number):
	orks_counter.text = "Orks: " + str(orks_number)

func _on_buildings_building_ploted(name):
	emit_signal("building_ploted", name)
