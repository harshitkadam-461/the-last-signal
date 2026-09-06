extends CharacterBody3D


const SPEED = 4.0
const RUN_SPEED = 7.0
const GRAVITY = 9.8


func _physics_process(delta):
	if not is_on_floor():
		velocity.y-= GRAVITY* delta
		
		
	var input_dir = Input.get_vector("move_left","move_right","move_forward","move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var speed = RUN_SPEED if Input.is_action_pressed("run") else SPEED
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)
			
	move_and_slide()
