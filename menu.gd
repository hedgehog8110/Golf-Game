extends Node2D

@onready var menu_anims = $AnimationPlayer
@onready var timer = $Timer
@onready var timer2 = $Timer2
@onready var timer3 = $Timer3
@onready var win_sound := $AudioStreamPlayer
var play_once = 1
var play_once2 = 1
var win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.Started = 0
	play_once = 1
	play_once2 = 1
	win = false
	menu_anims.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.win:
		get_tree().reload_current_scene()
		timer2.start()
		win_sound.play()
		menu_anims.play("fadein2")
		win = true
		Global.win = false
		
		
		
	else:
		if play_once == 1:
			if Input.is_action_just_pressed("ui_accept"):
				menu_anims.play("Fade out")
				timer.start()
				play_once = 0
	
	#if Input.is_action_pressed("ui_accept") && win:
		#menu_anims.play("fadeout2")
		#timer3.start()
		
		
		
	
		

func _on_timer_timeout() -> void:
	Global.Started = 1


func _on_timer_2_timeout() -> void:
	if play_once2 == 1:
		if Global.time <= 180:
			menu_anims.play("S")
		elif Global.time <= 300:
			menu_anims.play("A")
		elif Global.time <= 360:
			menu_anims.play("B")
		elif Global.time <= 480:
			menu_anims.play("C")
		elif Global.time >= 600:
			menu_anims.play("D")
		play_once2 = 0
		


func _on_timer_3_timeout() -> void:
	if win:
		get_tree().change_scene_to_file("res://Levels/Level1.tscn")
		win = false
		Global.win = false
	
	
