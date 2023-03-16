extends Node2D

signal use_move_vector
var move_vector = Vector2(0,0)
var joystick_active = false

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $CanvasLayer/TouchScreenButton.is_pressed():
			if event.position.y <1000:
				return
			move_vector = calculate_move_vector(event.position)
			joystick_active = true
	
	if event is InputEventScreenTouch:
		if event.pressed == false:
			joystick_active = false
			

func calculate_move_vector(event_position):
	var texture_center = $CanvasLayer/TouchScreenButton.position + Vector2(128,128)
	return (event_position - texture_center).normalized()
	
func _physics_process(delta):
	if joystick_active:
		emit_signal("use_move_vector",move_vector)

