extends Node2D

@export var entrance_distance := -10.0
@export var attack_distance := -610.0

@export var entrance_time := 0.3
@export var attack_time := 4.5
@export var return_time := 2.0

@export var wait_before_attack := 1.0
@export var wait_at_end := 3.0

@export var floor_move_distance := 60.0
@export var floor_move_time := 1.0

var activated := false
var start_position: Vector2
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"


func _ready():
	start_position = position

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if activated:
		return

	activated = true
	activate_wall()




func activate_wall():
	var entrance_position = start_position + Vector2(entrance_distance, 0)
	var attack_position = entrance_position + Vector2(attack_distance, 0)

	var tween = create_tween()

	tween.tween_property(self, "position", entrance_position, entrance_time)
	tween.tween_interval(0.5)
	tween.tween_property(self, "position", attack_position, attack_time)
	tween.tween_interval(3.0)
	tween.tween_property(self, "position", start_position, return_time)

	await tween.finished

	move_floor()

func move_floor():
	var floor = get_tree().current_scene.get_node("MovingFloor")

	var target = floor.position + Vector2(floor_move_distance, 0)

	var tween = create_tween()
	tween.tween_property(
		floor,
		"position",
		target,
		floor_move_time
	)
