extends Control


func _ready():
	AudioPlayer.get_child(1).stop()
	AudioPlayer.get_child(2).stop()
	AudioPlayer.get_child(0).play()
	if not CharacterInventory.check_save():
		$VBoxContainer/Continue.disabled = true


func _on_Start_pressed():
	AudioPlayer.get_child(1).play()
	CharacterInventory.characters = []
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/gacha/GachaScreen.tscn")


func _on_Continue_pressed():
	AudioPlayer.get_child(1).play()
	CharacterInventory.load_game()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/home/HomeScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_MainMenu_tree_exiting():
	AudioPlayer.get_child(0).stop()
