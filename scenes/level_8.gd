extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level = 8
	Global.collected_cherry = 0
	Global.level_cherry = 22

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
