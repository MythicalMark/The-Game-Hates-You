extends Area2D

var collected := false

func _on_body_entered(body: CharacterBody2D) -> void:
	if not body is CharacterBody2D:
		return

	if collected:
		return

	collected = true
	monitoring = false
	body.add_points(1)

	var collectibles_parent := get_parent()

	# This collectible is still counted, so 1 means it is the final one.
	if collectibles_parent.get_child_count() == 1:
		collectibles_parent.check_collectibles(true)

	queue_free()
