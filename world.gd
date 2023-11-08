extends Node

@onready var orks_counter = $UI/OrksCounter

func _on_units_orks_counted(orks_number):
	if orks_counter:
		orks_counter.text = "Orks: " + str(orks_number)
