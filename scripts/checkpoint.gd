extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var level_complete: Control = $"../CanvasLayer/LevelComplete"
@onready var timer: Timer = $Timer



@export var down_distance := 100.0
@export var left_distance := 660.0

@export var down_time := 0.1
@export var move_left_time := 1.5
@export var up_time := 0.4

var activated := false
var start_position: Vector2

var completed := false

func _ready():
	start_position = position


func _on_body_entered(body: CharacterBody2D) -> void:
	animated_sprite_2d.play("Collision")
	if body != character_body_2d:
		return

	if completed:
		return
	$Timer.start()
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "Collision":
		animated_sprite_2d.play("Idle")
		
func move_finish():
	if activated:
		return

	activated = true

	var underground_position = start_position + Vector2(0, down_distance)
	var other_side_underground = underground_position + Vector2(-left_distance, 0)
	var final_position = start_position + Vector2(-left_distance, 0)

	var tween = create_tween()

	# Go down into the ground
	tween.tween_property(
		self,
		"position",
		underground_position,
		down_time
	)

	# Move left while underground
	tween.tween_property(
		self,
		"position",
		other_side_underground,
		move_left_time
	)

	# Come back up
	tween.tween_property(
		self,
		"position",
		final_position,
		up_time
	)
	


func _on_move_detection_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return
	move_finish()


func _on_timer_timeout() -> void:
	completed = true
	level_complete.show_level_complete()
