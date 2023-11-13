extends CanvasLayer

@onready var buildings_panel = $Buildings
@onready var orks_counter = $OrksCounter


func _on_build_button_pressed():
	if buildings_panel.visible:
		buildings_panel.visible = false
	else:
		buildings_panel.visible = true

func set_orks_counter(orks_number):
	orks_counter.text = "Orks: " + str(orks_number)
