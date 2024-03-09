extends Node2D


const base = [
	preload("res://assets/GandalfHardcore Character Asset Pack/Character skin colors/Male Skin1.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Character skin colors/Male Skin2.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Character skin colors/Male Skin3.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Character skin colors/Male Skin4.png")
]

const hair = [  # Hair 17 to 20 got wrong color on the first part
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair1.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair2.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair3.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair4.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair5.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair6.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair7.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair8.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair9.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair10.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair11.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair12.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair13.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair14.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair15.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair16.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair21.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair22.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair23.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair24.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair25.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair26.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair27.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair28.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair29.png"),
	preload("res://assets/GandalfHardcore Character Asset Pack/Male Hair/Male Hair30.png")
]

const clothes_top: Texture = preload("res://assets/GandalfHardcore Character Asset Pack/Male Clothing/Shirt v2.png")
const clothes_mid: Texture = preload("res://assets/GandalfHardcore Character Asset Pack/Male Clothing/Pants.png")
const clothes_bot: Texture = preload("res://assets/GandalfHardcore Character Asset Pack/Male Clothing/Boots.png")
const hand: Texture = preload("res://assets/GandalfHardcore Character Asset Pack/Male Hand/Male Sword.png")

const parts = [
	"Base", "Hair",
	"Top", "Mid",
	"Bot", "Hand"
]
