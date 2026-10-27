extends Area2D


@onready var wire_anim = $Wire1/AnimationPlayer2
@onready var button_anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_anim.play("RESET")
	Global.button1 = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body == self: return
	if body.name == "Player" or "Ball":
		Global.button1 = 1
		button_anim.play("Button press")
		wire_anim.play("wire_turn_on")
	


func _on_body_exited(body: Node2D) -> void:
	if body == self: return
	if body.name == "Player" or "Ball":	
		if Global.player_or_ball == 0:
			Global.button1 = 0
		button_anim.play("Button release")
		wire_anim.play("wire_turn_off")
		
