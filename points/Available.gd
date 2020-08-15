# Displays the remaining number of points you have to spend.
extends Node


var m_allotted: int
var m_attr_points: Dictionary
onready var m_count = $Count


func _ready():
	Events.connect("allotted_changed", self, "_on_allotted_changed")
	Events.connect("points_changed", self, "_on_points_changed")


func _on_allotted_changed(t_value):
	m_allotted = t_value
	_update_current()
	pass


func _on_points_changed(t_attr, t_points):
	m_attr_points[t_attr] = t_points
	_update_current()


func _update_current():
	var allocated: int = 0

	for x in m_attr_points:
		allocated += m_attr_points[x]
	m_count.text = str(m_allotted - allocated)
