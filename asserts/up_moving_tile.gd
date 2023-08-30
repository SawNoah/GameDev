extends Spatial

func _on_up_moving_tile_ready():
	$tileLarge_forest/AnimationPlayer.play("updown_movement")
