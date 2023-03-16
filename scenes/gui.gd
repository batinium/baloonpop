extends Node2D

var bturret = load("res://scenes/turrets/n_turret.tscn")
var sturret = load("res://scenes/turrets/s_turret.tscn")

func _process(delta):
	$coins.text = str(Global.total_coins)
	$health.text = str(Global.base_health)
	


func _on_buys_button_down():
	if Global.total_coins >= 100:
		var new_turret = sturret.instantiate()
		new_turret.position = Vector2(500,700)
		$"..".add_child(new_turret)
		Global.total_coins -=100
		$spawn.play()



func _on_homebutton_button_down():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_buyn_button_down():
		if Global.total_coins >= 100:
			var new_turret = bturret.instantiate()
			new_turret.position = Vector2(500,700)
			$"..".add_child(new_turret)
			Global.total_coins -=100
			$spawn.play()
