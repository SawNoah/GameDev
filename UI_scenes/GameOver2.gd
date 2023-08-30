extends Control

export var MainScene : PackedScene

func _on_buttonplayagain_pressed():
	$audio/startAudio.play()
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene("res://Final Map/Level2.tscn")


func _on_button_mouse_entered():
	$audio/btnHoverAudio.play()

func _on_Control_ready():
	$audio/GameOver.play()

func _on_buttonmenu_pressed():
	$audio/startAudio.play()
	$Timer2.start()
	
func _on_Timer2_timeout():
	get_tree().change_scene(MainScene.resource_path)


