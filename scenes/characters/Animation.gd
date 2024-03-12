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
