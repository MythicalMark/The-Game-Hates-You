extends Node2D

@export var move_distance := 20.0
@export var move_time := 0.05

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

var saw1_activated := false
var saw2_activated := false
var saw3_activated := false
var saw4_activated := false
var saw5_activated := false


func move_saw(direction: Vector2):
	var target_position = position + direction * move_distance

	var tween = create_tween()
	tween.tween_property(
		self,
		"position",
		target_position,
		move_time
	)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if saw1_activated:
		return

	saw1_activated = true

	# Move right
	move_saw(Vector2.RIGHT)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if saw2_activated:
		return

	saw2_activated = true

	# Move up
	move_saw(Vector2.LEFT)


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if saw3_activated:
		return

	saw3_activated = true

	# Move up
	move_saw(Vector2.UP)



	


func _on_area_2d_5_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if saw5_activated:
		return

	saw5_activated = true

	# Move up
	move_saw(Vector2.UP)



	


func _on_saw_4_collision_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if saw4_activated:
		return

	saw4_activated = true

	# Move up
	move_saw(Vector2.UP)
