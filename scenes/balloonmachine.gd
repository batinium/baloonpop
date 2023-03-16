extends Node2D

var balloon = load("res://scenes/balloon.tscn")
var a_balloon

var rndx 
var rndy

func _process(delta):
	if Global.phase == 1:
		$balloontimer.wait_time = 1.5
	elif Global.phase == 2:
		$balloontimer.wait_time = 1
	elif Global.phase == 3:
		$balloontimer.wait_time = 0.5
	elif Global.phase == 4:
		$balloontimer.wait_time = 0.1
	
func _on_balloontimer_timeout():
	var rng = RandomNumberGenerator.new()
	rndx = rng.randf_range(0,1050)
	rndy = rng.randf_range(1700,1900)
	a_balloon = balloon.instantiate()
	a_balloon.position = Vector2(rndx,rndy)
	$".".add_child(a_balloon)



