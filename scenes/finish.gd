extends Area2D
@onready var label: Label = $Label

@export var target_level : PackedScene

func _on_body_entered(body):
	if Global.collected_cherry != Global.level_cherry:
		if label.visible == true:
			return
		label.visible = true
		await get_tree().create_timer(5).timeout
		label.visible = false
		return
	if body.name == "CharacterBody2D":
		
		var current_scene_name = get_tree().current_scene.name  # ดึงชื่อเลเวลปัจจุบัน
		var current_level_number = int(current_scene_name.replace("level", ""))  # เอาเฉพาะหมายเลขเลเวล
		get_tree().change_scene_to_file("res://scenes/Quiz 2.tscn")
