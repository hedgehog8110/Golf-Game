extends Area2D


@onready var Transition := $CanvasLayer3/Panel/AnimationPlayer
@export var par : GPUParticles2D
@onready var timer: Panel = get_tree().get_first_node_in_group("Timer")

const BALL_SCENE = preload("res://Gameplay/Ball.tscn")
const FILE_BEGIN = "res://Levels/Level"
var Transition_playing = 0

func _on_body_entered(body):
	
	if body.is_in_group("Ball"):
		is_instance_valid(timer.stop())
		$CanvasLayer3/Panel/Timer2.start()
		par.emitting = true
		$CanvasLayer3/Panel/Timer.start()
		Global.in_flag = 1
		$Win.play()
		
		
func _process(delta) -> void:
	if Input.is_action_just_pressed("next"):
		Transition.play("Transition_fade_out")
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
		Global.level = next_level_number -1
	#print(Global.level)
	
func _ready() -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	Transition.play("Transition_fade_out")
	Global.level = next_level_number -1
	Global.in_flag = 0
	

func respawn_ball(b):
	
	if b:
		b.queue_free()
	var ball = BALL_SCENE.instantiate()
	$"../..".add_child(ball)
	$"../..".ball = ball
	ball.global_position = Vector2(-1861.0, -479.0)


func _on_timer_timeout() -> void:
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
		Transition.play("Transition_fade_out")
		Global.level = next_level_number -1


func _on_timer_2_timeout() -> void:
	Transition.play("Transition_fade_in")
