extends Area2D
@onready var anim_wall := $AnimationPlayer
var play_anim = 0
var do_once = 0
var playing_anim = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	if playing_anim == 0 :
		anim_wall.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.button1 == 1:
		if play_anim == 0:
			anim_wall.play("Dissapear")
			play_anim = 1
			playing_anim = 1
	if Global.button1 == 0:
		if play_anim == 1:
				anim_wall.play("Appear")
				play_anim = 0
				playing_anim = 1
	if Global.player_or_ball == 1 and Global.button1 == 0:
		Global.player_or_ball = 2
			



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Global.player_or_ball = 1
		print(body.name)



func _on_body_exited(body: Node2D) -> void:
	Global.player_or_ball = 0
	
