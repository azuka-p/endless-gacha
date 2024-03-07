extends Node2D

class_name Character

var full_name: String = ""
var gender: String = ""

const FemaleCompositor = preload("res://scenes/characters/female/Female.gd")
var female_compositor = FemaleCompositor.new()

var rng = RandomNumberGenerator.new()

const Animation = preload("res://scenes/characters/Animation.gd")
var animation = Animation.new()

const Names = preload("res://scenes/characters/RandomNames.gd")
var names = Names.new()

func _ready():
	rng.randomize()
	var schlong = rng.randi_range(0, 1)
	schlong = 0
	if schlong == 0:
		full_name = names.get_full_name('female')
		gender = "female"
		generate_female()
		print(full_name, ", ", gender)

func random(size: int):
	rng.randomize()
	return rng.randi_range(0, size - 1)

func generate_female():
	var base = female_compositor.base
	var hair = female_compositor.hair
	var clothes_top = female_compositor.clothes_top
	var clothes_mid = female_compositor.clothes_mid
	var hand = female_compositor.hand
	var parts = female_compositor.parts
	
	var composites = [
		base[random(len(base))], hair[random(len(hair))],
		clothes_top, clothes_mid,
		hand
	]
	
	for i in range(len(parts)):
		animation.idle(get_node("CompositeSprites/{part}".format({"part": parts[i]})), composites[i])
