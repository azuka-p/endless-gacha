extends Control


const Character = preload("res://scenes/characters/Character.tscn")

func _on_Summon10_pressed():
	$NinePatchRect.visible = true
	for n in $NinePatchRect/GridContainer.get_children():
		n.remove_child(n.get_child(0))
		$NinePatchRect/GridContainer.remove_child(n)
	for _i in range(10):
		var new_panel = Panel.new()
		new_panel.rect_min_size = Vector2(160, 128)
		new_panel.self_modulate = "00ffffff"
		new_panel.set_h_size_flags(2)
		new_panel.set_v_size_flags(2)
		$NinePatchRect/GridContainer.add_child(new_panel)
		var new_char = Character.instance()
		new_char.init()
		CharacterInventory.characters.append(new_char)
		new_panel.add_child(new_char)
		var new_label = Label.new()
		new_label.text = new_char.full_name
		new_label.rect_min_size = Vector2(160, 14)
		new_label.rect_position = Vector2(0, 10)
		new_label.align = Label.ALIGN_CENTER
		new_panel.add_child(new_label)
	print("Total char: ", len(CharacterInventory.characters))

func _on_GachaScreen_tree_exiting():
	for n in $NinePatchRect/GridContainer.get_children():
		n.remove_child(n.get_child(0))
		$NinePatchRect/GridContainer.remove_child(n)
