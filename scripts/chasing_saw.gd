extends Node2D


@export var move_distance := 450
@export var move_time := 3.5
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

var activated := false

func _on_detector_saw_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		if activated:
			return

		activated = true
		
		var target_position = position + Vector2(move_distance, 0)

		var tween = create_tween()
		tween.tween_property(self, "position", target_position, move_time+1)


func _on_detection_2_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		if activated:
			return

		activated = true
		
		var target_position = position + Vector2(0, -move_distance)

		var tween = create_tween()
		tween.tween_property(self, "position", target_position, move_time+2)


func _on_detection_3_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		if activated:
			return

		activated = true
		
		var target_position = position + Vector2(move_distance+100, 0)

		var tween = create_tween()
		tween.tween_property(self, "position", target_position, move_time+2)
