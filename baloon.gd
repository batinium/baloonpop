extends AnimatedSprite2D
var rng = RandomNumberGenerator.new()

var rndx 
var rndy
var health
var randcolor = ["blue","red","green","purple","yellow"]
var speed = 1

func _ready():
	set_process_input(true)
	rndx = rng.randf_range(-1,1)
	rndy = rng.randf_range(1,5)
	health = floor(rng.randf_range(1,5))
	var colorpick = floor(rng.randf_range(0,5))
	$".".play(randcolor[colorpick])
	
	
func _physics_process(delta):
		$".".position.x +=rndx* speed
		$".".position.y -=rndy * speed
		if health <= 0:
			$".."/pop.play()
			queue_free()
		$health.text = str(health)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		health -=1


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_2d_body_entered(body):
		if body.is_in_group("bullet"):
			var bullet = body
			health -= bullet.damage
			bullet.penetration -=1
			gainmoney()
			if bullet.bullet_type == 2:
				speed = 0.3




func gainmoney():
	Global.total_coins +=1


func _on_area_2d_area_entered(area):
		if area.is_in_group("base"):
			var base = area
			self.health -=100
			Global.base_health -=1
			print("test")
