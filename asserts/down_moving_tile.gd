extends Spatial

func _on_down_moving_tile_ready():
	$tileLarge_forest/AnimationPlayer.play("down_movement")
