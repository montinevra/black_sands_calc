# Input for skill ranks and bonus points from your background package.
extends "Attribute.gd"


onready var m_bonus = $BackgroundBonus


func _on_points_changed(value):
	var points = m_rank.value + pow(m_rank.value, 2) - m_bonus.value
	
	if points < 0:
		points = 0
	m_points.text = String(points)
	._on_Points_value_changed(points)
