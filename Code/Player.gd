extends CharacterBody2D

@onready var anim_player := $AnimationPlayer
@export var par := GPUParticles2D

const jump_height: float = -550.0
const gravity: float = 14.5

var speed: float = 400
const acceleration: float = 12.5
const friction: = 4.5

const MAX_JUMPS: int = 2
var jumps_done: int = 0
const max_dashes: int = 1
var dashes: int = 0
const dash_speed: float = 650
const Wall_jumps: int = 1
var x_spawn = -2500.0
var y_spawn = -125




const JUMP_VELOCITY = -500.0



	
	
func respawn():
	
	self.global_position = Vector2(x_spawn, y_spawn)
	velocity.y = 0
	velocity.x = 0
	jumps_done = 0
	anim_player.play("RESET")
	
func _physics_process(delta: float) -> void:
	if Global.Started == 1 or Global.level >= 2:
		var x_input: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		var _velocity_weight: float = delta * (acceleration if x_input else friction)
		velocity.x = lerp(velocity.x, x_input * speed, _velocity_weight)
		
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = jump_height
			#par.emitting = true

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		
		if is_on_floor():
			jumps_done = 0
			anim_player.play("Idle")
		else:
			if jumps_done == 0:
				jumps_done += 1
				
		if Input.is_action_just_pressed("ui_up") and jumps_done < MAX_JUMPS:
			velocity.y = jump_height
			jumps_done += 1
			velocity.y += gravity
			
			
		if jumps_done > 1:
			anim_player.play("No_jump")
			
	
	
	move_and_slide()
	

	#@onready var bullet_scene = preload("res://bullet.gd")


		
	if Input.is_action_just_pressed("ui_reset"):
		if Global.in_flag == 0:
			respawn()

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("RigidBody"):
		body.collision_layer = 1
		body.collision_mask = 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("RigidBody"):
		body.collision_layer = 2
		body.collision_mask = 2
		
	if Input.is_action_pressed("ui_up"):
		anim_player.play("Jump")
	
func _process(_delta) -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var level_number = current_scene_file.to_int()
	if level_number == 1:
		x_spawn = -2505.0
		y_spawn = 1500
	if level_number == 2:
		x_spawn = -2414.0
		y_spawn = 1000
	if level_number == 3:
		x_spawn = -2514.0
		y_spawn = 1000
	if level_number == 4:
		x_spawn = -3368.445
		y_spawn = 478.0
	if level_number == 5:
		x_spawn = -838.0
		y_spawn = 3310.0
	if level_number == 6:
		x_spawn = -838.0
		y_spawn = 3310.0
	
	if Global.teleport_objects == 1:
		if Global.body_teleported == 1:
			if Global.teleporter1 == "Player":
				Global.body_teleported = 0
				position = Global.teleporter2_pos
				
			if Global.teleporter2 == "Player":
				position = Global.teleporter1_pos
				Global.body_teleported = 0
				
	if Global.player_or_ball == 2:
		respawn()
					
		
