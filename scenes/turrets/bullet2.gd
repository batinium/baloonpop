extends CharacterBody2D

var bullet_type = 2

var move = Vector2.ZERO
var speed = 30
var look_vec = Vector2.ZERO
var target
var damage =1
var direction = Vector2.ZERO
var penetration = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	if target !=null:
		$bullet.look_at(target.global_position)
		look_vec = target.global_position - global_position

func _process(delta):
	if penetration <=0:
		queue_free()

func _physics_process(delta):
	if target !=null:
		move = Vector2.ZERO
		move = target.global_position - global_position
		velocity += move.normalized()*speed
		move_and_slide()
	else:
		velocity += direction * speed
		move_and_slide()	
	

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_2d_area_entered(area):
	pass

func _on_dead_timeout():
	queue_free()
