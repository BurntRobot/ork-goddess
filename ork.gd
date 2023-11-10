extends CharacterBody2D

@onready var on_screen_label = $OnScreenLabel
@onready var attention_bar = $AttentionBar
@onready var health_timer = $HealthTimer
@onready var health_bar = $HealthBar
@onready var death_timer = $DeathTimer
@onready var chosen_mark = $Chosen
var health = 100
var attention = 100
var goddess_is_watching = false
var final_countdown = 10
var chosen = false
var attention_multiplier = 20
var zoom_multiplier = 1
var max_zoom_multiplier = 2.0 # брать из скрипта камеры
var health_boost = 30

func _ready():
	attention_bar.value = attention
	health_bar.value = health

func _process(delta):
	if chosen and not chosen_mark.visible:
		chosen_mark.visible = true
	elif not chosen and chosen_mark.visible:
		chosen_mark.visible = false
	if not death_timer.is_stopped():
		on_screen_label.text = str(roundf(death_timer.time_left))

func _on_visible_on_screen_notifier_2d_screen_entered():
	goddess_is_watching = true
func _on_visible_on_screen_notifier_2d_screen_exited():
	goddess_is_watching = false

func _on_attention_timer_timeout():
	if goddess_is_watching and attention < 100:
		attention += attention_multiplier * zoom_multiplier
	elif not goddess_is_watching and attention > 0:
		attention -= attention_multiplier * zoom_multiplier
	elif not goddess_is_watching and attention <= 0:
		attention = 0
		health_timer.paused = false
		health_timer.start()
	if goddess_is_watching and attention >= 100 and zoom_multiplier >= max_zoom_multiplier:
		attention = 100
		if not health_timer.is_stopped():
			health_timer.stop()
		if not death_timer.is_stopped():
			death_timer.stop()
			on_screen_label.text = ""
			health += health_boost
			health_bar.value = health
	attention_bar.value = attention

func _on_health_timer_timeout():
	if health > 0:
		health -= 10
	elif health == 0 and death_timer.is_stopped():
		death_timer.paused = false
		death_timer.start()
	health_bar.value = health

func _on_death_timer_timeout():
	queue_free()
