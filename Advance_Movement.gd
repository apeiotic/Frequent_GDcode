#Sprinting System

var sprinting_speed = 12
SPEED = 8.5
func sprint(): #(Run this function in physics process delta)
	camera.fov = lerp(camera.fov, 75.0, 0.1)
	if Input.is_action_pressed("Sprint"):
		if walking==true: #(when moving set the walking to true)
			SPEED = sprinting_speed
			actual_camera.fov = lerp(camera.fov, 90.0, 0.075) #(this is for FOV change of camera so you would need a refrence to camera)
	if Input.is_action_just_released("Sprint"):
		SPEED= 8.5
		


#Double Jump
var jumping_count=0
func double_jump():
	if Input.is_action_just_pressed("Jump"):
		if jumping_count<1:
			velocity.y=JUMP_VELOCITY
			jumping_count+= 1
	if is_on_floor():
		jumping_count=0


#Wallrun
var CanWallRun= true #(Create this variable if you want the wall run to be conditional)
var wallrunningUP = 7

func wallrun():
	if CanWallRun == true:
		if sprinting==true: #(if you only want to wallrun when you're sprinting)
			if is_on_wall():
				velocity.y=wallrunningUP
				gravity= 5
				SPEED=10
				wallrunning= true
			else:
				wallrunning= false
				SPEED= sprinting_speed 
