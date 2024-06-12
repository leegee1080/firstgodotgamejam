extends Node3D

var plat_height_max
var plat_height_min
var plat_x_left
var plat_x_right

var playerY
var player_dead = false

var camera: Node3D
var camera_script

@export var plat_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	
	camera = get_parent_node_3d().get_child(0)
	
	camera_script = camera.get_script()
	
	camera.start_follow($play_character)
	
	plat_height_max = get_meta("PLAT_HEIGHT_MAX")
	plat_height_min = get_meta("PLAT_HEIGHT_MIN")
	plat_x_left = get_meta("plat_left_x")
	plat_x_right = get_meta("plat_right_x")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_dead:
		return
	playerY = $play_character.position.y
	pass

func player_die():
	print("Player Dead, Gameover.")
	player_dead = true
	pass

func _on_timer_timeout():
	var new_plat = plat_scene.instantiate()
	new_plat.set_name("Platform")

	var xspawn = plat_x_left
	var coinflip = randi() % 100
	if coinflip > 50:
		xspawn = plat_x_right

	var plat_spawn_location = Vector3(xspawn, randf_range(plat_height_min + playerY, plat_height_max + playerY), 0)
	new_plat.initialize(plat_spawn_location)

	get_node("Platforms").add_child(new_plat)

	pass # Replace with function body.
