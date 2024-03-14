extends Control


func _on_Retreat_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/dungeon/DungeonScreen.tscn")


func _on_Main_Menu_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/MainMenu.tscn")
