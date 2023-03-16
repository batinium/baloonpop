extends Node2D

func _on_play_button_button_down():
	Global.total_coins = 1050
	Global.phase = 0
	Global.base_health = 5
	get_tree().change_scene_to_file("res://scenes/main.tscn")
