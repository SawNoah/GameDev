extends Spatial
signal Hitbox_body_entered

func _on_SpikeRoller_ready():
	$SpikeRoller/AnimationPlayer.play("rolling")


func _on_Hitbox_body_entered(body):
	if body.name == ("Character1"):
		emit_signal("Hitbox_body_entered")
		$audio/hurt.play()
