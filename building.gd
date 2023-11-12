extends StaticBody2D

@onready var sprite = $Sprite2D


func make_a_building(texture):
	sprite.texture = texture
