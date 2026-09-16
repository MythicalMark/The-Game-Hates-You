extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var character_body_2d: CharacterBody2D = $"."

const SPEED := 150.0
const JUMP_VELOCITY := -300.0
const MAX_JUMPS := 1
var gravity_multiplier = 1

var jumps_used := 0

signal points_changed(new_points)

var points := 0

var dead := false

var in_fly_zone := false
var fly_speed := 180.0

func _ready():
	var level_name = get_tree().current_scene.name

	if level_name == "Level3":
		point_light_2d.show()
	else:
		point_light_2d.hide()


func _physics_process(delta: float) -> void:
	
	if dead:
		return
	if not is_on_floor():
		velocity += get_gravity() * delta

	if in_fly_zone and Input.is_action_pressed("jump"):
		velocity.y = -fly_speed

	# Reset jumps when the player lands.
	if is_on_floor():
		jumps_used = 0

	# Handle first jump and double jump.
	if Input.is_action_just_pressed("jump") and jumps_used < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jumps_used += 1

		

	# Get horizontal input.
	var direction := Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()

	update_animation(direction)


func update_animation(direction: float) -> void:
	# Air animations.
	if not is_on_floor():
		# Let the double-jump animation finish before changing animations.
		if animated_sprite_2d.animation == "double_jump" \
				and animated_sprite_2d.is_playing():
			return

		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")

	# Ground animations.
	elif direction != 0:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")

func add_points(amount: int) -> void:
	points += amount
	points_changed.emit(points)
func die():
	dead = true

	$AnimatedSprite2D.hide()
	$CollisionShape2D.set_deferred("disabled", true)

	$GPUParticles2D.restart()
	$GPUParticles2D.emitting = true
	$AudioStreamPlayer2D.play()
func bounce(power: float):
	if dead:
		return

	velocity.y = -power
	jumps_used = 0
	animated_sprite_2d.play("jump")
func set_gravity(amount:float):
	gravity_multiplier = amount
	



func _on_flappy_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		in_fly_zone = true



func _on_flappy_body_exited(body: Node2D) -> void:
	if body == character_body_2d:
		in_fly_zone = false
