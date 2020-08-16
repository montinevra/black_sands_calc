extends Label


var m_floating = 0
onready var m_menu1 = $OptionButton1
onready var m_menu2 = $OptionButton2


func _ready():
	_update_menu(m_menu1, TalentList.talent_list)
	_update_menu(m_menu2, TalentList.talent_list)
	Events.connect("race_changed", self, "_on_race_changed")


func set_floating(t_idx):
	_on_OptionButton1_item_selected(t_idx)
	_on_OptionButton2_item_selected(t_idx)


func _on_race_changed(t_natural_talents: Dictionary):
	if t_natural_talents.has("floating"):
		m_floating = t_natural_talents["floating"]
		if m_floating >= 1:
			show()
			if m_floating >= 2:
				m_menu2.show()
			else:
				m_menu2.hide()
	else:
		hide()
		m_floating = 0


func _update_menu(t_menu: OptionButton, t_options: Array):
	t_menu.clear()
	for x in t_options:
		if x != "floating":
			t_menu.add_item(x)


func _on_OptionButton1_item_selected(index):
	var talent = m_menu1.get_item_text(index)
	
	Events.emit_signal("floating_changed", 0, talent)


func _on_OptionButton2_item_selected(index):
	var talent = m_menu2.get_item_text(index)
	
	Events.emit_signal("floating_changed", 1, talent)
