extends Node2D


func _process(delta):
	if Global.base_health <= 0:
		self.queue_free()
