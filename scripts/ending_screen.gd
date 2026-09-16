extends Control




func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
