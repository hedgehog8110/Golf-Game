extends Area2D


@onready var wire_anim = $AnimationPlayer2
@onready var wire2_anim = $AnimationPlayer3
@onready var button_anim = $AnimationPlayer
@onready var click := $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_anim.play("RESET")
	wire_anim.play("RESET")
	wire2_anim.play("Wire off")
	Global.button1 = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body == self: return
	if body.name == "Player":
		Global.button1 = 1
		button_anim.play("Button press")
		wire_anim.play("wire_turn_on")
		wire2_anim.play("wire_turn_on")
		click.play()
	elif body.name == "Ball":
		Global.button1 = 1
		button_anim.play("Button press")
		wire_anim.play("wire_turn_on")
		wire2_anim.play("wire_turn_on")
		click.play()
	


func _on_body_exited(body: Node2D) -> void:
	if body == self: return
	if body.name == "Player" or body.name == "Ball":
		if Global.player_or_ball == 0:
			Global.button1 = 0
			click.play()
		button_anim.play("Button release")
		wire_anim.play("wire_turn_off")
		wire2_anim.play("Wire_turn_off")
		
