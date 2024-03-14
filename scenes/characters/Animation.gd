extends Node2D


func idle(composite_part: AnimatedSprite, spritesheet: Texture):
	var sprite_frames = SpriteFrames.new()
	sprite_frames.add_animation("idle")
	sprite_frames.set_animation_loop("idle", true)
	var sprite_size := Vector2(80, 64)
	var full_spritesheet := spritesheet
	for i in range(5):
		var frame_tex := AtlasTexture.new()
		frame_tex.atlas = full_spritesheet
		frame_tex.region = Rect2(Vector2(80 * i, 0), sprite_size)
		sprite_frames.add_frame("idle", frame_tex)
	composite_part.frames = sprite_frames
	composite_part.animation = "idle"
	composite_part.play("idle")


func attack(composite_part: AnimatedSprite, spritesheet: Texture):
	var sprite_frames = composite_part.frames
	sprite_frames.add_animation("attack")
	sprite_frames.set_animation_loop("attack", false)
	sprite_frames.set_animation_speed("attack", 6)
	var sprite_size := Vector2(80, 64)
	var full_spritesheet := spritesheet
	for i in range(6):
		var frame_tex := AtlasTexture.new()
		frame_tex.atlas = full_spritesheet
		frame_tex.region = Rect2(Vector2(80 * i, 320), sprite_size)
		sprite_frames.add_frame("attack", frame_tex)


func die(composite_part: AnimatedSprite, spritesheet: Texture):
	var sprite_frames = composite_part.frames
	sprite_frames.add_animation("die")
	sprite_frames.set_animation_loop("die", false)
	sprite_frames.set_animation_speed("die", 10)
	var sprite_size := Vector2(80, 64)
	var full_spritesheet := spritesheet
	for i in range(10):
		var frame_tex := AtlasTexture.new()
		frame_tex.atlas = full_spritesheet
		frame_tex.region = Rect2(Vector2(80 * i, 384), sprite_size)
		sprite_frames.add_frame("die", frame_tex)
