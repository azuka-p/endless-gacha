extends Control

var selected_team := []
var selected_stage: int


func _ready():
	var character_list = CharacterInventory.characters
	for i in range(len(character_list)):
		var new_panel = Panel.new()
		new_panel.rect_min_size = Vector2(160, 128)
		new_panel.self_modulate = "00ffffff"
		new_panel.set_h_size_flags(2)
		new_panel.set_v_size_flags(2)
		new_panel.connect("gui_input", self, "_on_Panel_clicked", [new_panel])
		$Inventory/ScrollContainer/GridContainer.add_child(new_panel)
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


func _on_DungeonScreen_tree_exiting():
	for n in $Inventory/ScrollContainer/GridContainer.get_children():
		n.remove_child(n.get_child(0))
		$Inventory/ScrollContainer/GridContainer.remove_child(n)


func _on_Panel_clicked(event: InputEvent, panel: Panel):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		if len(selected_team) < 5:
			if not selected_team.has(panel):
				panel.self_modulate = "ffffff"
				selected_team.append(panel)
			else:
				panel.self_modulate = "00ffffff"
				selected_team.erase(panel)
		print(selected_team)


func _on_Go_pressed():
	pass # Replace with function body.


func _on_Stage_1_toggled(_button_pressed):
	if selected_stage == 1:
		$"Stage/GridContainer/Stage 1".pressed = false
		$VBoxContainer/Go.disabled = true
		selected_stage = 0
	else:
		$"Stage/GridContainer/Stage 1".pressed = true
		$VBoxContainer/Go.disabled = false
		selected_stage = 1
	print(selected_stage)
