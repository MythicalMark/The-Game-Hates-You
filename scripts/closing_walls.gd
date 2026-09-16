extends Node2D

@onready var top_tilemap: TileMap = $top_tilemap

@onready var bottom_tilemap: TileMap = $bottom_tilemap


@export var top_move_distance := 120.0
@export var bottom_move_distance := 140.0
@export var move_time := 3

var activated := false
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"



	


func close_gap():
	var top_target = top_tilemap.position + Vector2(
		0,
		top_move_distance
	)

	var bottom_target = bottom_tilemap.position + Vector2(
		0,
		-bottom_move_distance
	)

	var top_tween = create_tween()
	top_tween.tween_property(
		top_tilemap,
		"position",
		top_target,
		move_time
	)

	var bottom_tween = create_tween()
	bottom_tween.tween_property(
		bottom_tilemap,
		"position",
		bottom_target,
		move_time
	)

func _on_detectorwall_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if activated:
		return

	activated = true
	close_gap()
