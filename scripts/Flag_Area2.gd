extends Area
var next_level = false
func _on_Flag_Area_body_entered(body):
	if next_level == true:
		if body.name == "Character1":
			$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://UI_scenes/YouWin.tscn")


func _on_Counter_coins_completed():
	next_level = true
