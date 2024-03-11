extends Node2D

const Character = preload("res://scenes/characters/Character.tscn")

var characters := []

func _ready():
	print("Inventory initialized")

func save_game():
	var save: Save = Save.new()
	
	var list := []
	for n in characters:
		list.append([
			n.full_name,
			n.gender,
			n.composites
		])
	
	save.character_list = list
	
	var res = ResourceSaver.save("user://save.tres", save)
	print(res)

func load_game():
	var save: Save = ResourceLoader.load("user://save.tres")
	
	characters = []
	for n in save.character_list:
		var new_char = Character.instance()
		new_char.init(true)
		new_char.load_character(n)
		characters.append(new_char)
	print(characters)
	print(len(characters))

func check_save():
	return ResourceLoader.exists("user://save.tres")
