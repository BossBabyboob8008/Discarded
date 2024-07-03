extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 20
const UP = Vector2(0, -1)

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	
	motion = move_and_slide()

	# Handle jump.
	if Input.is_action_just_pressed("") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
