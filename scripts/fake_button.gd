extends Node2D

@onready var falling_wall: Node2D = $"../falling_wall"

@export var fall_distance := 1000.0
@export var fall_time := 1
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d_2: PointLight2D = $"../Node2D/PointLight2D2"


@onready var prompt_label: Label = $Label


var player_near := false
var activated := false


func _ready():
	prompt_label.hide()


func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		animated_sprite_2d.play("pressed")
		activate_trap()
		point_light_2d_2.visible = true



	



	


func activate_trap():
	if activated:
		return

	activated = true
	prompt_label.hide()

	var target_position = falling_wall.position + Vector2(0, fall_distance)

	var tween = create_tween()
	tween.tween_property(
		falling_wall,
		"position",
		target_position,
		fall_time
	)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body != character_body_2d:
		return

	player_near = false
	prompt_label.hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	player_near = true
	prompt_label.show()
