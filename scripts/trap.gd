extends Area2D
@onready var timer: Timer = $Timer



func _on_body_entered(body) -> void:
	body.die()
	get_tree().current_scene.find_child("Camera2D").shake()
	$Timer.start()








func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
