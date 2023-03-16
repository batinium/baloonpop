extends Node2D

var parent_rotation


func _on_button_pressed():
	if $"..".is_in_group("normalturret"):
		print("n_turret")
		if $"..".t_level < 3:
			if $"..".t_level == 0 && Global.total_coins - 100 > 0:
				$"..".t_level +=1
				Global.total_coins -=100
			elif $"..".t_level == 1&& Global.total_coins - 150 > 0:
				$"..".t_level +=1
				Global.total_coins -=150
			elif $"..".t_level == 2&& Global.total_coins - 200 > 0:
				$"..".t_level +=1
				Global.total_coins -=200
		$level2.text = str($"..".t_level)
	elif $"..".is_in_group("slowturret"):
		print("s_turret")
		if $"..".t_level < 1:
			if $"..".t_level == 0 && Global.total_coins - 200 > 0:
				$"..".t_level +=1
				Global.total_coins -=200
			$level2.text = str($"..".t_level)
