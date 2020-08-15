extends Node


onready var m_allotted = $Points/Allotted
onready var m_race = $Race


func _ready():
	m_allotted.set_allotted(100)
	m_race.set_race(0)
