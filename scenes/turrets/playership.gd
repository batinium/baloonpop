extends Node2D

var bullet = load("res://scenes/turrets/bullet1.tscn")
var bullet_s = load("res://scenes/turrets/bullet2.tscn")
var canshoot = false

var speed = 5
var motion = Vector2.ZERO
var player = null

var enemy
var enemy_list = []
var target = null

var selected = false

var t_level = 0

var arrowc = 1

func _process(delta):
	if t_level == 1:
		$shoottimer.wait_time = 1.5
	elif t_level == 2:
		arrowc = 2
		$shoottimer.wait_time = 1
	elif t_level == 3:
		$shoottimer.wait_time = 0.5
		
func _physics_process(delta):
	if enemy_list != []:
		target = enemy_list[0]
		if target:
			$gunbarrel.look_at(target.global_position)
			if canshoot:
				canshoot = !canshoot
				for i in arrowc:
					var b = bullet.instantiate()
					b.global_position = self.global_position - Vector2(20*i,0)
					get_parent().add_child(b)
					b.look_at(target.global_position)
					b.target = target
					$shoot.play()
#					var s = bullet_s.instantiate()
#					s.global_position = self.global_position - Vector2(50+20*i,0)
#					get_parent().add_child(s)
#					s.look_at(target.global_position)
#					s.target = target
#					$shoot.play()

				
	if Input.is_action_pressed("ui_up"):
		$".".position.y -=speed
	if Input.is_action_pressed("ui_down"):
		$".".position.y +=speed
	if Input.is_action_pressed("ui_left"):
		$".".position.x -=speed
	if Input.is_action_pressed("ui_right"):
		$".".position.x +=speed
	
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


func _on_joystick_use_move_vector(move_vector):
	self.position += move_vector * speed
