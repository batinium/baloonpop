extends Timer

func _on_timeout():
	if Global.phase < 10:
		Global.phase +=1
