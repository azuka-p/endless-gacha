extends Control


func _ready():
	var character_list = CharacterInventory.characters
	for i in range(len(character_list)):
		var new_panel = Panel.new()
		new_panel.rect_min_size = Vector2(160, 128)
		new_panel.self_modulate = "00ffffff"
		new_panel.set_h_size_flags(2)
		new_panel.set_v_size_flags(2)
		$NinePatchRect/ScrollContainer/GridContainer.add_child(new_panel)
		var character = character_list[i]
		new_panel.add_child(character)
		var new_label = Label.new()
		new_label.text = character.full_name
		new_label.rect_min_size = Vector2(160, 14)
		new_label.rect_position = Vector2(0, 10)
		new_label.align = Label.ALIGN_CENTER
		new_panel.add_child(new_label)

func _on_HomeScreen_tree_exiting():
	for n in $NinePatchRect/ScrollContainer/GridContainer.get_children():
		n.remove_child(n.get_child(0))
		$NinePatchRect/ScrollContainer/GridContainer.remove_child(n)
