# Input for skill ranks and bonus points from your background package.
extends "Attribute.gd"


onready var m_bonus = $BackgroundBonus


func _on_Rank_value_changed(value):
	m_points.value = value + pow(value, 2) - m_bonus.value


func _on_Points_value_changed(value):
	._on_Points_value_changed(value)


func _on_BackgroundBonus_value_changed(value):
	m_points.value = m_rank.value + pow(m_rank.value, 2) - value
