extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var active := false

func _ready() -> void:
	hide()
	monitoring = false

func activate() -> void:
	if active:
		return

	active = true
	show()
	monitoring = true

func _on_body_entered(body: CharacterBody2D) -> void:
	animated_sprite_2d.play("Collision")
	if active:
		print("Level Complete!")
