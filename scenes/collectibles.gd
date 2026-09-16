extends Node2D

@onready var end_point: Area2D = $"../End"


func _ready() -> void:
	# Makes the endpoint appear immediately when the level has no collectibles.
	if get_child_count() == 0:
		end_point.activate()


func check_collectibles(final_collectible_collected: bool = false) -> void:
	if final_collectible_collected or get_child_count() == 0:
		end_point.activate()
