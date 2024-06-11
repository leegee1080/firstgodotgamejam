extends RigidBody3D

const MOVE_SPEED = .1
var move_dir_left

var is_floating

@export var Area3d: Area3D
 
# Called when the node enters the scene tree for the first time.
func _ready():
	set_freeze_enabled(true)
	pass

func initialize(pos):
	is_floating = true
	position = pos
	if pos.x > 0:
		move_dir_left = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_floating:
		var movedir = 1
		if move_dir_left:
			movedir = -1
		position.x += (MOVE_SPEED * movedir)
	pass

func lock_platform():
	set_freeze_enabled(true)

func _on_timer_timeout():
	if is_floating:
		queue_free()
	pass

func _on_platform_check_timer_timeout():
	lock_platform()
	pass

func _on_player_collide_area_body_entered(body):
	Area3d.queue_free()
	is_floating = false
	set_freeze_enabled(false)
	pass


func _on_world_collide_area_body_entered(body):
	$PlatformCheckTimer.start()
	pass
