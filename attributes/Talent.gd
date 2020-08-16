# Input for talents.
extends "Attribute.gd"


var m_base_natural = 5
var m_floats = [0, 0]
var m_float_ct = 0
var m_natural = m_base_natural + m_floats[0] + m_floats[1]


func _ready():
	Events.connect("race_changed", self, "_on_race_changed")
	Events.connect("floating_changed", self, "_on_floating_changed")


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

	if t_new_naturals.has("floating"):
		m_float_ct = t_new_naturals["floating"]
	else:
		m_float_ct = 0
	m_base_natural = new_natural
	_update_natural()


func _on_floating_changed(t_idx: int, t_talent: String):
	if t_talent == name:
		m_floats[t_idx] = 1
	else:
		m_floats[t_idx] = 0
	_update_natural()
	pass


func _update_natural():
	m_natural = m_base_natural
	if m_float_ct >= 1:
		m_natural += m_floats[0]
		if m_float_ct >= 2:
			m_natural += m_floats[1]
	m_rank.min_value = m_natural - 3
	m_rank.max_value = m_natural + 5
	_on_Rank_value_changed(m_rank.value)


func _get_rank_cost(t_rank) -> int:
	var cost = 0
	
	for x in range(m_natural + 1, t_rank + 1):
		cost += (x) * (x - m_natural)
	return cost
