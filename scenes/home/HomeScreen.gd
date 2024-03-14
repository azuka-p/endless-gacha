extends Control

var selected_upgrade: Panel
var selected_fodder := []
var toggled_upgrade := false


func _ready():
	var character_list = CharacterInventory.characters
	for i in range(len(character_list)):
		var new_panel = Panel.new()
		new_panel.rect_min_size = Vector2(160, 128)
		new_panel.self_modulate = "00ffffff"
		new_panel.set_h_size_flags(2)
		new_panel.set_v_size_flags(2)
		new_panel.connect("gui_input", self, "_on_Panel_clicked", [new_panel])
		$NinePatchRect/ScrollContainer/GridContainer.add_child(new_panel)
		var character = character_list[i]
		new_panel.add_child(character)
		var new_label = RichTextLabel.new()
		new_label.bbcode_enabled = true
		new_label.add_text("Lv." + String(character.level) + " ")
		for _j in range(character.rarity):
			new_label.add_image(preload("res://assets/star.png"), 12, 12)
		new_label.add_text(" " + character.full_name)
		new_label.rect_min_size = Vector2(160, 18)
		new_label.rect_position = Vector2(0, 10)
		new_panel.add_child(new_label)


func _on_HomeScreen_tree_exiting():
	for n in $NinePatchRect/ScrollContainer/GridContainer.get_children():
		n.remove_child(n.get_child(0))
		$NinePatchRect/ScrollContainer/GridContainer.remove_child(n)


func _on_Panel_clicked(event: InputEvent, panel: Panel):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		if not toggled_upgrade:
			if selected_upgrade == null:
				panel.self_modulate = "ffffff"
				selected_upgrade = panel
				$VBoxContainer/Select.disabled = false
			elif selected_upgrade == panel:
				panel.self_modulate = "00ffffff"
				selected_upgrade = null
				$VBoxContainer/Select.disabled = true
			elif selected_upgrade != panel:
				selected_upgrade.self_modulate = "00ffffff"
				selected_upgrade = panel
				panel.self_modulate = "ffffff"
		elif toggled_upgrade:
			if panel != selected_upgrade and not selected_fodder.has(panel):
				panel.self_modulate = "ff0000"
				selected_fodder.append(panel)
			elif selected_fodder.has(panel):
				panel.self_modulate = "00ffffff"
				selected_fodder.erase(panel)
			print(selected_fodder)


func _on_Select_toggled(button_pressed):
	toggled_upgrade = button_pressed
	$VBoxContainer/Upgrade.disabled = false
	if toggled_upgrade == false:
		$VBoxContainer/Upgrade.disabled = true
		for n in selected_fodder:
			n.self_modulate = "00ffffff"
		selected_fodder.clear()
	print(toggled_upgrade)


func _on_Upgrade_pressed():
	var amount = 0
	for n in selected_fodder:
		var fodder = n.get_child(0)
		amount += LevelData.fodder_worth[fodder.rarity]
		CharacterInventory.characters.erase(fodder)
	selected_upgrade.get_child(0).add_exp(amount)
	var _res = get_tree().reload_current_scene()
