extends Node2D

var bullet = load("res://scenes/turrets/bullet2.tscn")
var canshoot = false

var speed = 25
var motion = Vector2.ZERO
var player = null

var enemy
var enemy_list = []
var target = null

var selected = false

var t_level = 0
func _process(delta):
	if t_level == 1:
		$shoottimer.wait_time = 1.5
	elif t_level == 2:
		$shoottimer.wait_time = 1
	elif t_level == 3:
		$shoottimer.wait_time = 0.5
		
func _physics_process(delta):
	if enemy_list != []:
		target = enemy_list[0]
		if target:
			$gunbarrel.look_at(target.global_position)
			if canshoot:
				var b = bullet.instantiate()
				b.global_position = self.global_position
				get_parent().add_child(b)
				canshoot = !canshoot
				b.look_at(target.global_position)
				b.target = target
				$shoot.play()
	else:
		pass
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		
func _on_shoottimer_timeout():
	canshoot = !canshoot
	
func _on_area_2d_area_entered(area):
	enemy = area
	enemy_list.append(enemy)

func _on_area_2d_area_exited(area):
	enemy_list.erase(area)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false

func _on_mouse_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		$shop.visible = !$shop.visible
