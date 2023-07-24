extends KinematicBody

export (NodePath) var animationtree

export var speed = 5.0
export var jump_impulse = 20.0
export var fall_accelaration = 70.0
var kick_air = 10.0
var jump_count = 0
var max_jump = 2
var velocity = Vector3.ZERO

func _ready():
	pass

func _physics_process(delta):
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("forward"):
		$AnimationTree["parameters/playback"].travel("Run")
		direction.z -= 1
		Run_Jump()
		Double_Jump()
		Attack()
		
	if Input.is_action_pressed("back"):
		$AnimationTree["parameters/playback"].travel("Run")
		direction.z += 1
		Run_Jump()
		Double_Jump()
		Attack()
		
	if Input.is_action_pressed("right"):
		$AnimationTree["parameters/playback"].travel("Run")
		direction.x += 1
		Run_Jump()
		Double_Jump()
		Attack()
		
	if Input.is_action_pressed("left"):
		$AnimationTree["parameters/playback"].travel("Run")
		direction.x -= 1
		Run_Jump()
		Double_Jump()
		Attack()

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
		if is_on_floor() and $audio/walkTimer.time_left <= 0:
			$audio/walkAudio.pitch_scale = rand_range(0.8, 1.2)
			$audio/walkAudio.play()
			$audio/walkTimer.start(0.25)
		
	else:
		$AnimationTree["parameters/playback"].travel("Idle")
		Stand_Jump()
		Attack()
		
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	if is_on_floor() and Input.is_action_pressed("crouch"):
		$AnimationTree["parameters/playback"].travel("Crouch")
		$Pivot/RobotArmature.translation.y = -0.35
		$CollisionShape.scale.y = 0.6
		$CollisionShape.translation.y = 0.6
	if is_on_floor() and Input.is_action_just_released("crouch"): 
		$Pivot/RobotArmature.translation.y = 0
		$CollisionShape.scale.y = 1
		$CollisionShape.translation.y = 0.8
	
	var gravity_resistence = get_floor_normal()	if is_on_floor() else Vector3.UP
	velocity -= gravity_resistence * fall_accelaration * delta

	velocity = move_and_slide(velocity, Vector3.UP)
	
func Stand_Jump():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_impulse 
		$AnimationTree["parameters/playback"].travel("Stand_Jump")
func Run_Jump():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_impulse 
		$AnimationTree["parameters/playback"].travel("Jump")
		jump_count = 1
func Double_Jump():
	if !is_on_floor() and Input.is_action_just_pressed("jump") and jump_count < max_jump:
		jump_count = 2
		velocity.y = kick_air
		velocity.x = speed
		velocity.z = speed
		$AnimationPlayer.play("Fall2")
	if is_on_floor():
		jump_count = 0
			
func Double_Jump2():
	if jump_count <= max_jump and !is_on_floor():
		
		if Input.is_action_just_pressed("jump") and jump_count <= max_jump:
			velocity.y = kick_air
			velocity.x = speed
			velocity.z = speed
			$AnimationPlayer.play("Fall2")
			jump_count +=1
	elif is_on_floor():
		 jump_count -= 1
		
func Attack():
	if is_on_floor() and Input.is_action_just_pressed("attack"):
		$AnimationPlayer.play("Attack1")

