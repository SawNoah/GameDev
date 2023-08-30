extends Spatial

func _on_side_moving_tile_ready():
	$tileLarge_forest/AnimationPlayer.play("side_movement")
