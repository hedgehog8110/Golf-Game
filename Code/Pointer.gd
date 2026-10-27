extends Sprite2D

@export var bullet:  PackedScene

var can_shoot: bool = true

func _physics_process(_delta):
	look_at(get_global_mouse_position())

#func spawn_bullet():
	#if can_shoot:
		#	if Input.is_action_pressed("ui_accept"):
		#		var bullet_instance = bullet.instantiate()
		#		bullet_instance.global_transform = global_transform
		#		get_parent().add_child(bullet_instance)
		#		can_shoot = false
		#		await get_tree().create_timer(0.2).timeout
		#		can_shoot = true
		
		
