extends Control


func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS



	
func _on_next_level_pressed() -> void:
	get_tree().paused = false

	var current_level = get_tree().current_scene.name

	match current_level:
		"Tutorial":
			get_tree().change_scene_to_file("res://scenes/level_1.tscn")

		"Level1":
			get_tree().change_scene_to_file("res://scenes/level_2.tscn")

		"level_2":
			get_tree().change_scene_to_file("res://scenes/level_3.tscn")

		"Level3":
			get_tree().change_scene_to_file("res://scenes/level_4.tscn")

		"Level4":
			get_tree().change_scene_to_file("res://scenes/level_5.tscn")

		

		_:
			print("No next level found!")
			get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
func show_level_complete() -> void:
	show()
	get_tree().paused = true
	var current_level = get_tree().current_scene.name
	
	match current_level:
		"Tutorial":
			GameManager.complete_level(1)
		"Level1":
			GameManager.complete_level(2)

		"level_2":
			GameManager.complete_level(3)

		"Level3":
			GameManager.complete_level(4)

		"Level4":
			GameManager.complete_level(5)

		"Level5":
			GameManager.complete_level(6)
