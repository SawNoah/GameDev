extends ProgressBar
signal life_lost

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "value", 100, 2).set_trans(Tween.TRANS_LINEAR)
	$"../../audio/health_fill".play()

func _on_enermy_Hitbox_body_entered():
	self.value = self.value - 10
	if self.value == 0:
		_ready()
		emit_signal("life_lost")


func _on_trap_Hitbox_body_entered():
	self.value = self.value - 10
	if self.value == 0:
		_ready()
		emit_signal("life_lost")
