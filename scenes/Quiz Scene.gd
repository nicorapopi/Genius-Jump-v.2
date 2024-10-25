extends Node

@onready var label: Label = $Label
@onready var button =[$Right,$wrong,$wrong2,$wrong3]
@onready var Button_position = [Vector2(228,329),Vector2(661,329),Vector2(228,450),Vector2(661,450)]
@onready var Button_Already_position = []
@onready var level = ["res://scenes/level1.tscn","res://scenes/level2.tscn","res://scenes/level3.tscn",
"res://scenes/level4.tscn","res://scenes/level5.tscn","res://scenes/level6.tscn","res://scenes/level7.tscn",
"res://scenes/level8.tscn","res://scenes/level9.tscn","res://scenes/level10.tscn"]

var Quiz = ["คุณอายุเท่าไหร่","แมวภาษาอังกฤษคืออะไร","A: What is your favorite color?
B: My favorite color is _l_e","W_at _s y_ur n_me?","A:Do you like pizza?
B:Yes, I like ______","Wh_t t_me _s it?","It's so hot, I need to wear a H_T",
"Please S_T on that chair","He can r_n very f__t.","I saw a R_T in the kitchen"]

var ans1 = ["How old are you?","what old are you?","How many age are you?",
"When old are you?"]

var ans2 = ["A.CAT","B.COT","C.CUT","D.CVT"]

var ans3 = ["B: My favorite color is blue.","A: My favorite color is lloe.",
"C: My favorite color is bird.","D: My favorite color is boat"]

var ans4 = ["D: What is your name?","B: What is your number?",
"C: What is your number?","A: What is your game?"]

var ans5 = ["A:Yes I like Pizza","B: I like it","C: I like chess"
,"D: I like Potato"]

var ans6 = ["A: What time is it?",
"B: What color is it?",
"C: Where time is it?",
"D: What time was it?"]

var ans7 = ["A. HAT","B. HIT","C. HOT","D. HUT"]

var ans8 = ["C: Please SIT on that chair.",
"B: Please FAT on that chair.",
"A: Please EAT on that chair.",
"D: Please KIT on that chair."]

var ans9 = ["A: He can run very fast.",
"B: He can run very fat.",
"C: He can rat very fat.",
"D: He can rin very fort."]

var ans10 = ["C: I saw a RAT in the kitchen.",
"B: I saw a RET in the kitchen.",
"A: I saw a ROT in the kitchen.",
"D: I saw a TNT in the kitchen."]

var All_Answer = [ans1,ans2,ans3,ans4,ans5,ans6,ans7,ans8,ans9,ans10]

var x:int
var y:int
var v = 0

func _ready() -> void:
	y = randi_range(0,len(Quiz)-1)
	if label == null :
		return
	label.text = Quiz[y]
	while Global.already_quiz.has(label.text):
		y = randi_range(0,len(Quiz)-1)
		if label == null :
			return
		label.text = Quiz[y]
	print(Global.already_quiz)

	for i in button:
		x = randi_range(0,len(Button_position)-1)
		i.text = All_Answer[y][v]
		v += 1
	
		if Button_Already_position.has(x):
			detect(i)
			print(Button_Already_position.has(x))
		else :
			Button_Already_position.append(x)
			i.global_position = Button_position[x]
	print(Button_Already_position)

func detect(i):
	while Button_Already_position.has(x):
		x = randi_range(0,len(Button_position)-1)
	i.global_position = Button_position[x]
	Button_Already_position.append(x)

func _on_right_pressed():
	print(len(Global.already_quiz))
	if len(Global.already_quiz) >= 9:
		get_tree().change_scene_to_file("res://scenes/end_game.tscn")
		return
	Global.already_quiz.append(Quiz[y])
	get_tree().change_scene_to_file(level[Global.level])

func _on_wrong_pressed():
	get_tree().change_scene_to_file(level[Global.level - 1])

func _on_wrong_2_pressed():
	get_tree().change_scene_to_file(level[Global.level - 1])

func _on_wrong_3_pressed():
	get_tree().change_scene_to_file(level[Global.level - 1])
