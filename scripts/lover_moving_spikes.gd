extends Node2D


@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@export var move_distance := 40.0
@export var move_time := 0.01

var activated := false
var start_position: Vector2


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if activated:
		return

	activated = true

	var target_position = start_position + Vector2(move_distance, 0)

	var tween = create_tween()
	tween.tween_property(
		self,
		"position",
		target_position,
		move_time
	)
