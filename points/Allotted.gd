# Input the number of points you have to spend on your character.
extends Node


onready var m_allotted = $Count


func _ready():
	Events.emit_signal("allotted_changed", m_allotted.value)


func set_allotted(t_value):
	m_allotted.value = t_value
	Events.emit_signal("allotted_changed", t_value)


func _on_Count_value_changed(value):
	Events.emit_signal("allotted_changed", value)
