extends Control

export var MainScene : PackedScene

func _on_buttonplayagain_pressed():
	$audio/startAudio.play()
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene(MainScene.resource_path)

func _on_buttonplayagain_mouse_entered():
	$audio/btnHoverAudio.play()
