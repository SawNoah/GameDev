extends Area

func _on_RestartArea_body_entered(body):
	if body.name == "Character1":
		#get_tree().reload_current_scene()
		get_tree().change_scene("res://UI_scenes/GameOverTutorial.tscn")
