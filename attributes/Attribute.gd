# Base class for anthing you can spend points on.
# Inherited by Talent, Skill, and Cost.
extends Node


onready var m_name = $".".text
onready var m_rank = $Rank
onready var m_points = $Points


func _on_Rank_value_changed(value):
	pass


func _on_Points_value_changed(value):
	Events.emit_signal("points_changed", m_name, value)
