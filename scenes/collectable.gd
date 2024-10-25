extends Area2D

@onready var game_manager = %GameManager


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		Global.collected_cherry += 1
		queue_free()
		game_manager.add_point()
