extends Node2D

var time: float = 0.0
var Started
var playerpos
var ball_pos
var teleporter1
var teleporter1_pos
var teleporter2
var teleporter2_pos
var teleport_objects
var tele1_is_detecting
var tele2_is_detecting
var button1 = 0
var wall_type
var level = 1
var player_or_ball = 0
var body_teleported = 1
var switch_pos = 1
var wire1 = 0
var in_flag
var msec
var seconds
var minutes
var M: float
var S: float
var MS: float
var past_time_M
var past_time_S
var past_time_MS
var win : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_flag == 0 and Started == 1:
		time += delta
	#print(time)
	if in_flag == 0:
		if Input.is_action_just_pressed("ui_reset"):
			if minutes >= 0:
				time = time - minutes
				time = time - seconds
