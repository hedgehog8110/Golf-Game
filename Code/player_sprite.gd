extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("ui_right"):
			if rotation == 0:
				rotate(0.3)
				position.y - 100
	else:
		rotation = 0
		position.y = 0
		
	if Input.get_action_strength("ui_left"):
			if rotation == 0:
				rotate(-0.3)
