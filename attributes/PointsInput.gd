# Base class for anthing you can spend points on.
# Inherited by Attribute, and Cost.
extends Node


onready var m_name = $".".text
onready var m_points = $Points


func _on_Points_value_changed(value):
	Events.emit_signal("points_changed", m_name, value)
