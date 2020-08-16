# Race/natural talent selector
extends Node


const natural_talents = {
	"Gyrstall": {
		"Force": 5, 
		"Charisma": 5, 
		"Quickness": 5, 
		"Perception": 5, 
		"Dexterity": 5, 
		"Intelligence": 5, 
		"Toughness": 5, 
		"Moxy": 5,
		"floating": 2,
	},
	"Harnwulf": {
		"Force": 6, 
		"Charisma": 5, 
		"Quickness": 5, 
		"Perception": 5, 
		"Dexterity": 5, 
		"Intelligence": 4, 
		"Toughness": 6, 
		"Moxy": 6,
	},
	"Iktani": {
		"Force": 5, 
		"Charisma": 5, 
		"Quickness": 5, 
		"Perception": 6, 
		"Dexterity": 6, 
		"Intelligence": 5, 
		"Toughness": 5, 
		"Moxy": 5,
	},
	"Seledhior": {
		"Force": 5, 
		"Charisma": 6, 
		"Quickness": 6, 
		"Perception": 5, 
		"Dexterity": 5, 
		"Intelligence": 6, 
		"Toughness": 5, 
		"Moxy": 4,
	},
	"Coast Vulture": {
		"Force": 4, 
		"Charisma": 5, 
		"Quickness": 6, 
		"Perception": 5, 
		"Dexterity": 6, 
		"Intelligence": 5, 
		"Toughness": 4, 
		"Moxy": 6,
		"floating": 1,
	},
	"Dustcropper": {
		"Force": 5, 
		"Charisma": 5, 
		"Quickness": 4, 
		"Perception": 5, 
		"Dexterity": 5, 
		"Intelligence": 5, 
		"Toughness": 6, 
		"Moxy": 6,
		"floating": 1,
	},
	"Ice Stalker": {
		"Force": 6, 
		"Charisma": 4, 
		"Quickness": 6, 
		"Perception": 5, 
		"Dexterity": 6, 
		"Intelligence": 5, 
		"Toughness": 5, 
		"Moxy": 5,
	},
}
onready var m_menu = $OptionButton


func set_race(t_new_race):
	m_menu.select(t_new_race)
	_on_OptionButton_item_selected(t_new_race)


func _on_OptionButton_item_selected(index):
	var race = m_menu.get_item_text(index)
	var natural = natural_talents[race]
	
	Events.emit_signal("race_changed", natural)
