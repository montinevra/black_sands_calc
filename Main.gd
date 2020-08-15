extends Node


onready var m_allotted = $Points/Allotted


func _ready():
	m_allotted.set_allotted(100)
