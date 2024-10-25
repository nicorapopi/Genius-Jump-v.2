extends CanvasLayer
@onready var texture_button: TextureButton = $TextureButton
@onready var point_label: Label = %PointLabel
@onready var audio = AudioServer.get_bus_index("Master")
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var label: Label = $NinePatchRect/Label
var count = 50
var db:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(audio)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	point_label.text = "Points:  "+ str(Global.point)
	label.text = var_to_str(count)
	pass

func showui(a):
	if db:
		nine_patch_rect.visible = false
		db = false
	else :
		nine_patch_rect.visible = true
		db = true


func _on_texture_button_gui_input(event: InputEvent) -> void:
	if not event.is_action_pressed("mouse_left"):
		return
	if event.is_action_pressed("mouse_left"):
		showui(1)


func _on_minus_gui_input(event: InputEvent) -> void:
	if not event.is_action_pressed("mouse_left"):
		return
	if count <= 1 :
		return
	count -= 5
	AudioServer.set_bus_volume_db(audio,count/2-50)
	AudioServer.set_bus_mute(audio,count < .1)


func _on_plus_gui_input(event: InputEvent) -> void:
	if not event.is_action_pressed("mouse_left"):
		return
	if count >= 100 :
		return
	count += 5
	AudioServer.set_bus_volume_db(audio,count/2-50)
	AudioServer.set_bus_mute(audio,count < .1)
	print(AudioServer.get_bus_volume_db(audio))


func _on_texture_button_2_pressed() -> void:
	Global.level = 0
	Global.point = 0
	Global.collected_cherry = 0
	Global.level_cherry = 0
	Global.already_quiz.clear()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
