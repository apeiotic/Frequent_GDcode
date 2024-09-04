# Default/simple movement System
var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
if direction:
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
else:
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.z = move_toward(velocity.z, 0, SPEED)





#Slippry Movement system

var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	
var camera_basis = camera.global_transform.basis
var direction = camera_basis * Vector3(input_dir.x, 0, input_dir.y)
direction = direction.normalized()
if direction:
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	walking=true
else:
	# Lerp towards 0 velocity
	var lerp_amount = 0.05 # Adjust this value for smoother/faster deceleration
	velocity.x = lerp(velocity.x, 0.0, lerp_amount)
	velocity.z = lerp(velocity.z, 0.0, lerp_amount)
	walking=false





#Camera Movement 
var sensitivity = 0.05
@onready var camera = $Node3D/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
