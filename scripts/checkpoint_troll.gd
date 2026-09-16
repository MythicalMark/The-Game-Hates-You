extends Area2D



@onready var bomb: AnimatedSprite2D = $"../Bomb"
@onready var ending_screen: Control = $"../CanvasLayer/EndingScreen"


@export var bomb_drop_distance := 100.0
@export var bomb_drop_time := 0.4
@export var explosion_delay := 0.3

var activated := false

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var explosion_sound: AudioStreamPlayer2D = bomb.get_node("ExplosionSound")

	


func start_ending_troll(player: Node2D) -> void:
	# Wait after the player reaches the finish.
	await get_tree().create_timer(3.0).timeout

	# Drop the bomb.
	var target_position = bomb.position + Vector2(0, bomb_drop_distance)

	var tween = create_tween()
	tween.tween_property(
		bomb,
		"position",
		target_position,
		bomb_drop_time
	)

	await tween.finished

	# Play the explosion animation.
	explosion_sound.play()
	await get_tree().create_timer(0.2).timeout
	bomb.play("Explosion")
	bomb.scale = Vector2(4,4)
	
	

	# Kill the player.
	if player.has_method("die"):
		player.die()

	# Wait for the explosion animation to finish.
	await bomb.animation_finished

	# Small pause before ending screen.
	await get_tree().create_timer(0.5).timeout

	show_ending_screen()


func show_ending_screen() -> void:
	ending_screen.show()
	get_tree().paused = true




func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("Collision")
	if body != character_body_2d:
		return

	if activated:
		return

	activated = true
	start_ending_troll(body)
