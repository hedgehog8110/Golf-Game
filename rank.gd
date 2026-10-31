extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = get_global_mouse_position().y / -80
	position.x = get_global_mouse_position().x / -80
	move_local_x(920)
	move_local_y(600)
