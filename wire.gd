extends Node2D
@onready var wire_anim = $AnimationPlayer
var play = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wire_anim.play("RESET")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play == 1:
		if Global.wire1 == 1:
			wire_anim.play("wire_turn_on")
			play = 0
		else:
			wire_anim.play("wire_turn_off")
			play = 0
		
	if Global.button1 == 1:
		play = 1
		
		
