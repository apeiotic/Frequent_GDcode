#movement System
var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
if direction:
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
else:
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.z = move_toward(velocity.z, 0, SPEED)


#Camera Movement 
var sensitivity = 0.05

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
