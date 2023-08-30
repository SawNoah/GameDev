extends Label
signal coins_completed
var coins = 0

func _ready():
	text = String(coins)

func _on_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 1:
		emit_signal("coins_completed")


