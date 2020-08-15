# Input for talents.
extends "Attribute.gd"


var m_natural = 5


func _ready():
	Events.connect("race_changed", self, "_on_race_changed")


func _on_Rank_value_changed(value):
	var baseline = value - m_natural
	
	if baseline < 0:
		m_points.value = baseline * 5
	else:
		m_points.value = _get_rank_cost(value)


func _on_Points_value_changed(value):
	._on_Points_value_changed(value)


func _on_race_changed(t_new_naturals):
	var new_natural = t_new_naturals[m_name]
	
	_update_natural(new_natural)


func _update_natural(t_new_natural):
	m_natural = t_new_natural
	m_rank.min_value = t_new_natural - 3
	m_rank.max_value = t_new_natural + 5
	_on_Rank_value_changed(m_rank.value)


func _get_rank_cost(t_rank) -> int:
	var cost = 0
	
	for x in range(m_natural + 1, t_rank + 1):
		cost += (x) * (x - m_natural)
	return cost
