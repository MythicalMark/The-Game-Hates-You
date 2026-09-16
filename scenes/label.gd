extends Label

@onready var player: CharacterBody2D = $"../../CharacterBody2D"


func _ready():
	player.points_changed.connect(_on_points_changed)
	text = "Points: %d" % player.points

func _on_points_changed(new_points: int):
	text = "Points: %d" % new_points
