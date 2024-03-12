extends Control


func _ready():
	if not CharacterInventory.check_save():
		$HBoxContainer/Load.disabled = true

func _on_Save_pressed():
	CharacterInventory.save_game()
	$HBoxContainer/Load.disabled = false

func _on_Load_pressed():
	CharacterInventory.load_game()
	var _res = get_tree().reload_current_scene()

func _on_Dungeon_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/dungeon/DungeonScreen.tscn")

func _on_Gacha_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/gacha/GachaScreen.tscn")

func _on_Home_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/home/HomeScreen.tscn")

func _on_Main_Menu_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/MainMenu.tscn")
