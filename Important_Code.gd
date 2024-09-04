func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Quit"): #("Quit" is an input set from project settings)
		get_tree().quit()

#For restarting the current Better for quick checkin
	if Input.is_action_just_pressed("Restart"): #("Restart" is an input set from project settings)
		get_tree().reload_current_scene()
