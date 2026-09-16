extends AnimatedSprite2D

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var animated_sprite_2d: AnimatedSprite2D = $"."



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		animated_sprite_2d.scale = Vector2(4,4)
		animated_sprite_2d.play("Explosion")
		
