extends Area2D

var detected
var cooldown = 0
@export var par : GPUParticles2D
@onready var timer: Panel = get_tree().get_first_node_in_group("Timer")
@onready var teleporter_anim = $AnimationPlayer
@onready var teleport := $AudioStreamPlayer
@onready var cooldown_time := $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.teleporter1 = null
	Global.teleporter1_pos = global_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Global.switch_pos == 1:
		teleporter_anim.play("Player")
	else:
		teleporter_anim.play("Ball")
		
func _on_body_entered(body):
	if Global.switch_pos == 1:
		if cooldown == 0:
			if body.name == "Player":
				Global.teleporter1 = body.name
				print("PLAYER")
				teleport.play()
				cooldown = 1
				cooldown_time.start()
				Global.teleport_objects = 1
				if Global.body_teleported == 2:
					Global.body_teleported = 1
				
	if Global.switch_pos == 0:
		if cooldown == 0:
			if body.name == "Ball":
				Global.teleporter1 = body.name
				print("BALL")
				teleport.play()
				cooldown = 1
				cooldown_time.start()
				Global.teleport_objects = 1
				if Global.body_teleported == 2:
					Global.body_teleported = 1
				
		
		
	
		
			

func _on_body_exited(body: Node2D) -> void:
	Global.teleporter1 = null
	Global.body_teleported = 2

	


func _on_timer_timeout() -> void:
	cooldown = 0
