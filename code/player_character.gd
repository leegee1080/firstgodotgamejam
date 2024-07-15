extends CharacterBody3D

@export var game_scene: Node3D

const SPEED = 5.0
const JUMP_VELOCITY = 20

var has_jumped

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func messagefirst_queuefree():
	game_scene.player_die()
	queue_free()
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity *2 * delta
	else:
		has_jumped = false
		
	# Handle jump. press jump in air to rapid drop
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		MasterScene.play_sound(0)
		velocity.y = JUMP_VELOCITY
		has_jumped = true
	if Input.is_action_just_pressed("Jump") and not is_on_floor() and has_jumped:
		MasterScene.play_sound(0)
		velocity.y = -JUMP_VELOCITY * 2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Move Left", "Move Right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
