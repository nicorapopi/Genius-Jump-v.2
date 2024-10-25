extends Area2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body):
	if body is Player :
		audio_stream_player.play()
		await audio_stream_player.finished
		get_tree().reload_current_scene()
		Global.point = 0
		Global.collected_cherry = 0
