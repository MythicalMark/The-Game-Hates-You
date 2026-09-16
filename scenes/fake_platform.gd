extends AnimatableBody2D

@export var move_distance := 30.0
@export var speed := 200.0

var target_position: Vector2
var triggered := false

func _ready():
	target_position = position + Vector2(move_distance,0)

func _physics_process(delta):
	if triggered:
		position = position.move_toward(target_position, speed * delta)


func _on_detection_zone_body_entered(body: Node2D) -> void:
	triggered = true
