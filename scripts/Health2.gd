extends Label
var health = 3
signal dead

func _ready():
	text = String(health)

func _on_Timer_timeout():
	print("Gameover")
	get_tree().change_scene("res://UI_scenes/GameOver2.tscn")


func _on_HealthBar_life_lost():
	health = health -1
	$"../../audio/health_fill".play()
	_ready()
	if health == 0:
		emit_signal("dead")
		$Timer.start()
