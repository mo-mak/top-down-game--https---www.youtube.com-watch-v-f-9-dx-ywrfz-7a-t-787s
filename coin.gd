extends Area2D

signal coin_touched
@onready var coin_audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		coin_touched.emit()
		coin_audio.play()
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
		
