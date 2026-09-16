extends Node2D

@export var normal_camera_left := -1150
@export var normal_camera_right := 1520
@export var normal_camera_top := 0
@export var normal_camera_bottom := 429

@onready var camera: Camera2D = $CharacterBody2D/Camera2D



func _ready():
	camera = find_child("Camera2D", true, false)

	if camera == null:
		print("Camera2D could not be found!")



	


func _on_node_2d_button_pressed() -> void:
	if camera == null:
		return

	camera.limit_left = normal_camera_left
	camera.limit_right = normal_camera_right
	camera.limit_top = normal_camera_top
	camera.limit_bottom = normal_camera_bottom

	print("Camera limits restored!")
