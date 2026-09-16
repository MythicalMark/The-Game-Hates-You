extends CanvasModulate


@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var fake_button: Node2D = $"../Fake_button"
@onready var point_light_2d_3: PointLight2D = $"../Fake_button/PointLight2D3"





	

func _on_darkness_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		visible = true
		body.point_light_2d.visible = true
		point_light_2d_3.visible = true



func _on_light_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		visible = false
		body.point_light_2d.visible = false
		point_light_2d_3.visible = false
