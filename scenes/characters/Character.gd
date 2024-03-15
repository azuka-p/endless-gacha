extends Node2D

class_name Character

var full_name: String = ""
var gender: String = ""
var composites: Array
var rarity: int
var level: int
var exp_to_next: int
var stat: int

var rng = RandomNumberGenerator.new()

const Animation = preload("res://scenes/characters/Animation.gd")
var animation = Animation.new()

const Names = preload("res://scenes/characters/RandomNames.gd")
var names = Names.new()


func _ready():
	# init()
	pass


func init(is_load: bool = false):  # Pseudo-constructor
	if is_load:
		pass
	else:
		rng.randomize()
		var schlong = rng.randi_range(0, 1)
		if schlong == 0:
			gender = "female"
			generate_female()
		else:
			gender = "male"
			generate_male()
		full_name = names.get_full_name(gender)

		rng.randomize()
		var roll = rng.randf()
		if roll <= 0.05:
			rarity = 3
		elif roll <= 0.25:
			rarity = 2
		else:
			rarity = 1

		level = 1
		exp_to_next = LevelData.leveling[rarity]
		stat = LevelData.base_stats[rarity]
		print(full_name, ", ", gender, ", ", rarity)


func random(size: int):
	rng.randomize()
	return rng.randi_range(0, size - 1)


func generate_animation(parts: Array, part_composites: Array):
	for i in range(len(parts)):
		var part = get_node("CompositeSprites/{part}".format({"part": parts[i]}))
		animation.idle(part, part_composites[i])
		animation.attack(part, part_composites[i])
		animation.die(part, part_composites[i])
		if not part.is_connected("animation_finished", self, "_on_Animation_finished"):
		# warning-ignore:return_value_discarded
			part.connect("animation_finished", self, "_on_Animation_finished", [part])


func _on_Animation_finished(part: AnimatedSprite):
	if part.animation == "attack":
		part.play("idle")


func play_animation(anim: String):
	var parts: Array
	if gender == "female":
		parts = Female.parts
	else:
		parts = Male.parts
	for i in range(len(parts)):
		var part = get_node("CompositeSprites/{part}".format({"part": parts[i]}))
		part.play(anim)


func generate_female():
	var base = Female.base
	var hair = Female.hair
	var clothes_top = Female.clothes_top
	var clothes_mid = Female.clothes_mid
	var hand = Female.hand
	var parts = Female.parts

	composites = [base[random(len(base))], hair[random(len(hair))], clothes_top, clothes_mid, hand]

	generate_animation(parts, composites)


func generate_male():
	var base = Male.base
	var hair = Male.hair
	var clothes_top = Male.clothes_top
	var clothes_mid = Male.clothes_mid
	var clothes_bot = Male.clothes_bot
	var hand = Male.hand
	var parts = Male.parts

	composites = [
		base[random(len(base))],
		hair[random(len(hair))],
		clothes_top,
		clothes_mid,
		clothes_bot,
		hand
	]

	generate_animation(parts, composites)


func load_character(character: Array):
	full_name = character[0]
	gender = character[1]
	composites = character[2]
	rarity = character[3]
	level = character[4]
	exp_to_next = character[5]
	stat = character[6]
	var parts: Array
	if gender == "female":
		parts = Female.parts
	else:
		parts = Male.parts
	generate_animation(parts, composites)


func add_exp(amount: int):
	while amount >= exp_to_next:
		amount -= exp_to_next
		stat += LevelData.stat_increase[rarity]
		if level == LevelData.max_level[rarity] and rarity != 3:
			rarity += 1
			level = 1
		else:
			level += 1
		exp_to_next = LevelData.leveling[rarity]
	exp_to_next -= amount
