extends Control

export var mainGameScene : PackedScene
export var tutorialScene : PackedScene

#New Game Button
func _on_NewGamebtn_button_up():
	$audio/btnEnterAudio.play()
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/NewGamebtn/NewGameTimer.start()

func _on_NewGameTimer_timeout():
	get_tree().change_scene(mainGameScene.resource_path)

func _on_NewGamebtn_mouse_entered():
	$audio/btnHoverAudio.play()


#Tutorial Button
func _on_Tutorialbtn_button_up():
	$audio/btnEnterAudio.play()
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer2/Tutorialbtn/TutorialTimer.start()
	
func _on_Tutorialbtn_mouse_entered():
	$audio/btnHoverAudio.play()
	
func _on_TutorialTimer_timeout():
	get_tree().change_scene(tutorialScene.resource_path)


#Exit Button
func _on_Exitbtn_button_up():
	$audio/btnEnterAudio.play()
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer3/Exitbtn/ExitTimer.start()

func _on_Exitbtn_mouse_entered():
	$audio/btnHoverAudio.play()

func _on_ExitTimer_timeout():
	get_tree().quit()
