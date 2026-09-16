extends Area2D

@export var camera_left := -1150
@export var camera_right := 640
@export var camera_top := 0
@export var camera_bottom := 429
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"



	

func _on_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	var camera: Camera2D = get_tree().current_scene.find_child(
		"Camera2D",
		true,
		false
	)

	if camera == null:
		print("Camera2D not found!")
		return

	camera.limit_left = camera_left
	camera.limit_right = camera_right
	camera.limit_top = camera_top
	camera.limit_bottom = camera_bottom

	print("Camera limits restricted!")
