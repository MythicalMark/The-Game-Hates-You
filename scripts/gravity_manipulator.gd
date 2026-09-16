extends Node2D
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"




func _on_slower_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return
	body.set_gravity(.1)


func _on_default_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return
	body.set_gravity(1)
