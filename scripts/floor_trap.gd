extends Node2D


@export var move_distance := -24
@export var move_time := 0.1
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"




var activated := false


func _on_area_2d_11_body_entered(_body: Node2D) -> void:
	if _body == character_body_2d:
		if activated:
			return

		activated = true

		var target_position = position + Vector2(0, move_distance)

		var tween = create_tween()
		tween.tween_property(self, "position", target_position, move_time)
