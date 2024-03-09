extends Node2D

class_name Character

var full_name: String = ""
var gender: String = ""

var rng = RandomNumberGenerator.new()

const Animation = preload("res://scenes/characters/Animation.gd")
var animation = Animation.new()

const Names = preload("res://scenes/characters/RandomNames.gd")
var names = Names.new()

func _ready():
	rng.randomize()
	var schlong = rng.randi_range(0, 1)
	if schlong == 0:
		full_name = names.get_full_name('female')
		gender = "female"
		generate_female()
		print(full_name, ", ", gender)
	else:
		full_name = names.get_full_name('male')
		gender = "male"
		generate_male()
		print(full_name, ", ", gender)

func random(size: int):
	rng.randomize()
	return rng.randi_range(0, size - 1)

func generate_idle(parts: Array, composites: Array):
	for i in range(len(parts)):
		animation.idle(get_node("CompositeSprites/{part}".format({"part": parts[i]})), composites[i])

func generate_female():
	var base = Female.base
	var hair = Female.hair
	var clothes_top = Female.clothes_top
	var clothes_mid = Female.clothes_mid
	var hand = Female.hand
	var parts = Female.parts
	
	var composites = [
		base[random(len(base))], hair[random(len(hair))],
		clothes_top, clothes_mid,
		hand
	]
	
	generate_idle(parts, composites)

func generate_male():
	var base = Male.base
	var hair = Male.hair
	var clothes_top = Male.clothes_top
	var clothes_mid = Male.clothes_mid
	var clothes_bot = Male.clothes_bot
	var hand = Male.hand
	var parts = Male.parts
	
	var composites = [
		base[random(len(base))], hair[random(len(hair))],
		clothes_top, clothes_mid,
		clothes_bot, hand
	]
	
	generate_idle(parts, composites)
