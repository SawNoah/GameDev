extends Control

export var tutorialScene : PackedScene


func _on_start_game_button_up():
	$audio/btnEnterAudio.play()
	$Timer.start()


func _on_start_game_mouse_entered():
	$audio/btnHoverAudio.play()


func _on_Timer_timeout():
	get_tree().change_scene(tutorialScene.resource_path)
