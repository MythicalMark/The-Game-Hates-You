extends Camera2D




var shake_strength := 0.0

func _process(_delta):
	if shake_strength > 0:
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
	else:
		offset = Vector2.ZERO

func shake(strength := 2.5):
	shake_strength = strength

	await get_tree().create_timer(0.15).timeout

	shake_strength = 0.0
	offset = Vector2.ZERO
