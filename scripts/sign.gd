extends StaticBody2D


@onready var label: Label = $Label
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == character_body_2d:
		label.visible = false
