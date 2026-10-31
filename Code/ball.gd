extends RigidBody2D

var ball_x_spawn = -1845.0
var ball_y_spawn = -466.0
var ball_x
var ball_y
var typed_array_x: Array[int] = [-1845.0, -1845.0, 1845.0, -4006.0]
var typed_array_y: Array[int] = [1250, 900, 900, -467.0]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Global.ball_pos = position
	if Global.Started == 0:
		freeze = true
	else:
		freeze = false
	
	if Input.is_action_just_pressed("ui_reset"):
		if Global.in_flag == 0:
			respawn_ball()
	var current_scene_file = get_tree().current_scene.scene_file_path
	var level_number = current_scene_file.to_int()
	if level_number == 1:
		ball_x_spawn = -1845.0
		ball_y_spawn = 1250
	if level_number == 2:
		ball_x_spawn = -1845.0
		ball_y_spawn = 900
	if level_number == 3:
		ball_x_spawn = -1845.0
		ball_y_spawn = 900
	if level_number == 4:
		ball_x_spawn = -2705.0
		ball_y_spawn = 301.0
	if level_number == 5:
		ball_x_spawn = -398.0
		ball_y_spawn = 3134.0
	if level_number == 6:
		ball_x_spawn = -398.0
		ball_y_spawn = 3134.0

	if Global.teleport_objects == 1:
		if Global.body_teleported == 1:
			if Global.teleporter1 == "Ball":
				position = Global.teleporter2_pos
				Global.body_teleported = 0
			if Global.teleporter2 == "Ball":
				position = Global.teleporter1_pos
				Global.body_teleported = 0
				

func respawn_ball():
	global_position
	self.global_position = Vector2(ball_x_spawn, ball_y_spawn) 
	linear_velocity.x = 0
	linear_velocity.y = 0
