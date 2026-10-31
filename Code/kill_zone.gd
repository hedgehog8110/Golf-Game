extends Node2D

const BALL_SCENE = preload("res://Gameplay/Ball.tscn")
@onready var timer: Panel = get_tree().get_first_node_in_group("Timer")



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_reset"):
		

		#timer.reset_timer()
		timer.start()
		

func _on_body_entered(body):

	if body.name == "Player":
		body.respawn()
	elif body.is_in_group("Ball"):
		body.respawn_ball()
		



	
