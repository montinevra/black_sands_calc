# Input for miscellaneous costs (background packages, (dis)advantages, etc.)
extends "PointsInput.gd"


enum Mode{COST = 1, CREDIT = -1}
export(Mode) var mode = 1


func _on_Points_value_changed(value):
	._on_Points_value_changed(value * mode)
