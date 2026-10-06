extends Area2D

signal coin_touched
@onready var coin_audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(self, "position", position + Vector2(0, -1), 1)
	tween.tween_property(self, "position", position + Vector2(0, 1), 1)

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		var tween = create_tween()
		
		coin_touched.emit()
		coin_audio.play()
		
		tween.set_parallel(true)
		tween.tween_property(self, "position", position + Vector2(0, -50), 0.3)
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		tween.chain().tween_callback(self.queue_free)
		
		
		
		
