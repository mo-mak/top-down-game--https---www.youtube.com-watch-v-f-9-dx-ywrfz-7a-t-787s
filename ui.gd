extends CanvasLayer

var coins : int = 0
@onready var score_number: Label = $scoreNumber

func _process(delta: float) -> void:
	score_number.text = str(coins)

func _on_coin_coin_touched() -> void:
	coins += 1
