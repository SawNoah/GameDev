extends Area

signal coin_collected

func _ready():
	pass

func _physics_process(delta):
	rotate_y(deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "Character1":
		$AnimationPlayer.play("bounce")
		$Timer.start()

func _on_Timer_timeout():
	emit_signal("coin_collected")
	queue_free()
