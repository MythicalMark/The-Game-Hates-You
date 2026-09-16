extends Node2D


@export var wall_move_distance := 200.0
@export var wall_move_time := 0.8
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

@onready var prompt_label: Label = $Label
@onready var trampoline_3: Area2D = $"../Trampoline3"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var moving_wall: TileMap = $"../Moving_wall"

@export var trampoline_move_distance := 14.0
@export var trampoline_move_time := 0.5


var player_near := false
var activated := false

signal button_pressed

func _ready():
	prompt_label.hide()
	


func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		activate_button()


func activate_button():
	if activated:
		return

	activated = true
	prompt_label.hide()
	animated_sprite_2d.play("pressed")

	var target_position = moving_wall.position + Vector2(0, -wall_move_distance)

	var tween = create_tween()
	tween.tween_property(
		moving_wall,
		"position",
		target_position,
		wall_move_time
	)
	var trampoline_target = trampoline_3.position + Vector2(
		0,
		-trampoline_move_distance
	)

	var trampoline_tween = create_tween()
	trampoline_tween.tween_property(
		trampoline_3,
		"position",
		trampoline_target,
		trampoline_move_time
	)
	button_pressed.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	player_near = true

	if not activated:
		prompt_label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body != character_body_2d:
		return

	player_near = false
	prompt_label.hide()
