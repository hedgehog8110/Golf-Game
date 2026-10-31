extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var running = true
var time_completed
var prev_time_completed
var M 
var S 
var MS

func _ready() -> void:
	if Global.level >= 1:
		Global.msec = Global.MS
		Global.seconds = Global.S
		Global.minutes = Global.M
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if Global.Started == 1 or Global.level >= 2:
		if running == true:
			process(delta)
			time += delta
			msec = (fmod(time, 1) * 100) + Global.MS
			seconds = fmod(time, 60) + Global.S
			minutes = (fmod(time, 3600) / 60) + Global.M
			Global.msec = fmod(time, 1) * 100
			Global.seconds = fmod(time, 60)
			Global.minutes = fmod(time, 3600) / 60
			$Minutes.text = "%02d:" % minutes
			$Seconds.text = "%02d." % seconds
			$Msecs.text = "%03d" % msec
			M = minutes
			S = seconds
			MS = msec
			if Input.is_action_just_pressed("ui_reset"):
				if Global.in_flag == 0:
					reset_timer()
					start()
			
					

	
func stop():
	running = false
	
func start() -> void:
	running = true
	
func reset_timer():
		set_process(true)
		if Global.in_flag == 0:
			if Input.is_action_pressed("ui_reset"):
				time = 0.0
				minutes = 0
				seconds = 0
				msec = 0
			if Global.win:
				time = 0.0
				minutes = 0
				seconds = 0
				msec = 0
		
func process(_delta) -> void:
	if Global.level >= 1:
		#if Global.in_flag == 1:
#			Global.past_time_M = Global.past_time_M + minutes
#			Global.past_time_S = Global.past_time_S + seconds
#			Global.past_time_MS = Global.past_time_MS + msec
#			print("In")
		if Global.level == 6:
			if Global.in_flag == 1:
				Global.Started = 0
				Global.msec = fmod(Global.time, 1) * 100
				Global.seconds = fmod(Global.time, 60)
				Global.minutes = fmod(Global.time, 3600) / 60
				$Minutes.text = "%02d:" % Global.minutes
				$Seconds.text = "%02d." % Global.seconds
				$Msecs.text = "%03d" % Global.msec
		if Input.is_action_just_pressed("ui_reset"):
			set_process(true)
			msec = 0
			seconds = 0
			minutes = 0
	
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
