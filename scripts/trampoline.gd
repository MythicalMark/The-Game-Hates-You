extends Area2D


@export var bounce_power := 550.0
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -bounce_power
		animated_sprite_2d.play("bounce")
