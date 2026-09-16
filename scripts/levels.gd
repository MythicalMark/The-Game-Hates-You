extends Control

@onready var tutorial: Button = $GridContainer/Tutorial

@onready var level_1: Button = $"GridContainer/Level 1"

@onready var level_2: Button = $"GridContainer/Level 2"

@onready var level_3: Button = $"GridContainer/Level 3"

@onready var level_4: Button = $"GridContainer/Level 4"

@onready var level_5: Button = $"GridContainer/Level 5"


func _ready() -> void:
	tutorial.disabled = GameManager.highest_level_unlocked < 1
	level_1.disabled = GameManager.highest_level_unlocked < 2
	level_2.disabled = GameManager.highest_level_unlocked < 3
	level_3.disabled = GameManager.highest_level_unlocked < 4
	level_4.disabled = GameManager.highest_level_unlocked < 5
	level_5.disabled = GameManager.highest_level_unlocked < 6





func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")


func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")


func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")




func _on_reset_progress_pressed() -> void:
	get_tree().reload_current_scene()
	GameManager.reset_progress()
