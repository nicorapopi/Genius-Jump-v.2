extends Node
@onready var point_label = %PointLabel

var points = 0

func add_point():
	Global.point += 1
	print(points)
	
