extends Area2D

var play_anim = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.level == 6:
		if Global.button1 == 1 and play_anim == 1:
			if Global.wall_type == 1:
				#anim_wall.play("Dissapear2")
				play_anim = 0
		
		if Global.button1 == 0 and play_anim == 0:
			if Global.wall_type == 1:
				#anim_wall.play("Appear2")
				play_anim = 1
		
