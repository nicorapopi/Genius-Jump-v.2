extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level = 10
	Global.collected_cherry = 0
	Global.level_cherry = 16

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
