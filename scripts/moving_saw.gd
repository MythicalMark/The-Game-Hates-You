extends Node2D

@export var move_distance := 330
@export var move_time := 1.5

var start_position: Vector2


func _ready():
	start_position = position
	move_saw()


func move_saw():
	var tween = create_tween()
	tween.set_loops()

	# Move down
	tween.tween_property(
		self,
		"position",
		start_position + Vector2(0, -move_distance),
		move_time
	)

	# Move back up
	tween.tween_property(
		self,
		"position",
		start_position,
		move_time
	)
