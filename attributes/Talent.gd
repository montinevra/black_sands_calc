# Input for talents.
extends "Attribute.gd"


var m_natural = 5


func _ready():
	Events.connect("race_changed", self, "_on_natural_changed")
	pass


func _on_Rank_value_changed(value):
	var baseline = value - m_natural
	
	if baseline < 0:
		m_points.value = baseline * 5
	else:
		m_points.value = _get_rank_cost(m_natural, value)


func _on_Points_value_changed(value):
	._on_Points_value_changed(value)


func _on_natural_changed(t_naturals):
	var new_natural = t_naturals[m_name]

	m_natural = new_natural
	m_rank.min_value = new_natural - 3
	m_rank.max_value = new_natural + 5
	m_points.max_value = _get_rank_cost(new_natural, new_natural + 5)
	_on_Rank_value_changed(m_rank.value)


func _get_rank_cost(t_natural, t_rank) -> int:
	var cost = 0
	
	for x in range(t_natural + 1, t_rank + 1):
		cost += (x) * (x - m_natural)
	return cost
