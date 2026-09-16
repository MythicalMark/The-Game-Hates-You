extends Control


func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()


func toggle_pause() -> void:
	var paused = not get_tree().paused
	get_tree().paused = paused

	if paused:
		show()
	else:
		hide()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
