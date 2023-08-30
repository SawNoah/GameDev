extends Area

func _on_RestartArea_body_entered(body):
	if body.name == "Character1":
		get_tree().change_scene("res://UI_scenes/GameOver2.tscn")
