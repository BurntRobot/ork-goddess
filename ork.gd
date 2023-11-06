extends CharacterBody2D

@onready var on_screen_label = $OnScreenLabel
@onready var attention_bar = $AttentionBar
@onready var health_timer = $HealthTimer
@onready var health_bar = $HealthBar
@onready var death_timer = $DeathTimer
var health = 100
var attention = 100
var goddess_is_watching = false
var final_countdown = 10

func _ready():
	attention_bar.value = attention
	health_bar.value = health

func _on_visible_on_screen_notifier_2d_screen_entered():
	on_screen_label.text = "OnScreen"
	goddess_is_watching = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	on_screen_label.text = "NotOnScreen"
	goddess_is_watching = false

func _on_attention_timer_timeout():
	if goddess_is_watching and attention < 100:
		attention += 10
	elif not goddess_is_watching and attention > 0:
		attention -= 10
	elif not goddess_is_watching and attention <= 0:
		attention = 0
		health_timer.paused = false
		health_timer.start()
	elif goddess_is_watching and attention == 100:
		health_timer.stop()
		death_timer.stop()
	attention_bar.value = attention

func _on_health_timer_timeout():
	if health > 0:
		health -= 10
	elif health == 0 and death_timer.is_stopped():
		death_timer.paused = false
		death_timer.start()
		print("aaaa")
	health_bar.value = health

func _on_death_timer_timeout():
	queue_free()
