extends Control


func _ready():
	if not CharacterInventory.check_save():
		$VBoxContainer/Continue.disabled = true


func _on_Start_pressed():
	CharacterInventory.characters = []
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/gacha/GachaScreen.tscn")


func _on_Continue_pressed():
	CharacterInventory.load_game()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/home/HomeScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()
