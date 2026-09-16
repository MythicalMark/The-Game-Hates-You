extends Node2D

@onready var trampoline: Area2D = $Trampoline


@onready var spikes: Node2D = $spikes

@export var trampoline_rise_distance := 18.0
@export var spike_drop_distance := 8.0
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

@export var trampoline_rise_time := 0.1
@export var spike_drop_time := 0.1

var activated := false



	


func activate_trap():
	var trampoline_target = trampoline.position + Vector2(
		0,
		-trampoline_rise_distance
	)

	var spike_target = spikes.position + Vector2(
		0,
		spike_drop_distance
	)

	var trampoline_tween = create_tween()
	trampoline_tween.tween_property(
		trampoline,
		"position",
		trampoline_target,
		trampoline_rise_time
	)

	var spike_tween = create_tween()
	spike_tween.tween_property(
		spikes,
		"position",
		spike_target,
		spike_drop_time
	)

func _on_trap_activator_body_entered(body: Node2D) -> void:
	if body != character_body_2d:
		return

	if activated:
		return

	activated = true
	activate_trap()
