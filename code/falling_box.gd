class_name Platform

extends RigidBody3D

const MOVE_SPEED = .1
var move_dir_left

var is_floating
var is_locked

var selected_color: Color = Color.WHITE

var mesh: MeshInstance3D
@export var main_collider_array: Array[CollisionShape3D]
@export var particle: CPUParticles3D

var friend_platform

func initialize(pos, color):
	add_to_group("platforms")
	mesh = $MeshInstance3D
	set_freeze_enabled(true)
	is_floating = true
	#for item in main_collider_array:
		#item.disabled = true
	position = pos
	selected_color = color
	if pos.x > 0:
		move_dir_left = true
	pick_color()


func pick_color():
	var mat: Material = mesh.get_active_material(0).duplicate()
	mat.albedo_color = selected_color
	mesh.material_override = mat


func _process(_delta):
	if is_floating:
		var movedir = 1
		if move_dir_left:
			movedir = -1
		position.x += (MOVE_SPEED * movedir)


func _on_timer_timeout():
	if is_floating:
		queue_free()


func _on_player_collide_area_body_entered(_body):
	$PlayerCollideArea.queue_free()
	is_floating = false
	#for item in main_collider_array:
		#item.disabled = false
		#print(item)
	set_freeze_enabled(false)


func _on_world_collide_area_body_entered(_body: Node3D):
	if !is_floating:
		if _body is RigidBody3D and _body.is_in_group("platforms") and _body != self:
			if _body.selected_color == self.selected_color:
				$PlatformCheckTimer.start()
				friend_platform = _body


func _on_platform_check_timer_timeout():
	lock_platform()


func lock_platform():
	if friend_platform == null and !friend_platform.is_floating and !friend_platform.is_locked:
		return null
	var pin = PinJoint3D.new()
	pin.node_a = self.get_path()
	pin.node_b = friend_platform.get_path()
#	particle.position = pin.position
	particle.emitting = true
	add_child(pin)
	is_locked = true
