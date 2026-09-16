extends AnimatableBody2D

@export var move_distance := 50.0
@export var move_time := 0.3
@onready var character_body_2d: CharacterBody2D = $"../../CharacterBody2D"

var activated := false

func _on_detection_area_body_entered(_body):
	if _body == character_body_2d:
		if activated:
			return

		activated = true

		var target_position = position + Vector2(move_distance, 0)

		var tween = create_tween()
		tween.tween_property(self, "position", target_position, move_time)
