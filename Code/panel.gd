extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var running = true
var time_completed
var prev_time_completed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if running == true:
		process(delta)
		time += delta
		msec = fmod(time, 1) * 100
		seconds = fmod(time, 60)
		minutes = fmod(time, 3600) / 60
		$Minutes.text = "%02d:" % minutes
		$Seconds.text = "%02d." % seconds
		$Msecs.text = "%03d" % msec
		if Input.is_action_just_pressed("ui_reset"):
			reset_timer()
			start()

	
func stop():
	running = false
	if Input.is_action_pressed("ui_reset"):
		running = true
		var time_completed = time
		print(time_completed)
func start() -> void:
	running = true
	
func reset_timer():
		set_process(true)
		if Input.is_action_pressed("ui_reset"):
			time = 0.0
			minutes = 0
			seconds = 0
			msec = 0
		
func process(delta) -> void:	
		if Input.is_action_just_pressed("ui_reset"):
			set_process(true)
			msec = 0
			seconds = 0
			minutes = 0
	
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
