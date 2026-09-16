extends Node

var highest_level_unlocked := 1

const SAVE_PATH := "user://savegame.save"


func _ready() -> void:
	load_game()


func complete_level(level_number: int) -> void:
	if level_number + 1 > highest_level_unlocked:
		highest_level_unlocked = level_number + 1
		save_game()


func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	file.store_var(highest_level_unlocked)


func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	highest_level_unlocked = file.get_var()
	
func reset_progress() -> void:
	highest_level_unlocked = 1
	save_game()
