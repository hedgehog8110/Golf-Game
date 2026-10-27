extends CharacterBody2D

const jump_height: float = -550.0
const gravity: float = 14.5

const max_speed: float = 80
const acceleration: float = 8
const friction: = 10

const MAX_JUMPS: int = 2
var jumps_done: int=0




const SPEED = 600.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_height

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if is_on_floor():
		jumps_done = 0
	else:
		if jumps_done == 0:
			jumps_done += 1
			
	if Input.is_action_just_pressed("ui_up") and jumps_done < MAX_JUMPS:
		velocity.y = jump_height
		jumps_done += 1
		velocity.y += gravity
		


	# if velocity > 20:
		set


	move_and_slide()
