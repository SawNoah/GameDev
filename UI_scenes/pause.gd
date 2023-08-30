extends CanvasLayer

func _ready():
	set_visible(false)
 
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Resume_pressed():
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	$ColorRect/audio/btnEnterAudio.play()
	
func _on_Button_mouse_entered():
	$ColorRect/audio/btnHoverAudio.play()

func _on_Restart_pressed():
	get_tree().reload_current_scene()
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	$ColorRect/audio/btnEnterAudio.play()

func _on_ExitGame_pressed():
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	$ColorRect/audio/btnEnterAudio.play()
	$ColorRect/MarginContainer2/VBoxContainer/VBoxContainer/MarginContainer3/ExitGame/ExitTimer.start()

func _on_ExitTimer_timeout():
	get_tree().change_scene("res://UI_scenes/MainMenu.tscn")
