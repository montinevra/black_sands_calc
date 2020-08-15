# Base class for anthing you can spend points on.
# Inherited by Talent and Skill.
extends "PointsInput.gd"


onready var m_rank = $Rank


func _on_Rank_value_changed(value):
	pass
