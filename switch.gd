extends Area2D

var switch_pos = 1
var wait_until_exit = 0
@onready var switch_anim = $AnimationPlayer
@onready var switch := $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_anim.play("RESET")
	Global.switch_pos = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_reset"):
		Global.switch_pos = 1
		switch_anim.play("RESET")
	#if Input.is_action_just_pressed("ui_accept"):
		#if Global.switch_pos == 1:
			#Global.switch_pos = 0
			#print(Global.switch_pos)
		#else:
			#Global.switch_pos = 1
			#print(Global.switch_pos)

func _on_body_entered(body: Node2D) -> void:
	if Global.switch_pos == 1:
			Global.switch_pos = 0
			print(Global.switch_pos)
			switch_anim.play("Switch to left")
			switch.play()
	else:
		switch_anim.play("Switch to right")
		Global.switch_pos = 1
		print(Global.switch_pos)
		switch.play()
