extends CanvasLayer

@onready var buildings_panel = $Buildings


func _on_build_button_pressed():
	if buildings_panel.visible:
		buildings_panel.visible = false
	else:
		buildings_panel.visible = true
