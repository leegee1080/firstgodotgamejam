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

var selected_colors
signal spawned_platform(Platform)


func _ready():
	
	camera = get_parent_node_3d().get_child(0)
	
	selected_colors = $"..".avail_colors_dict[$"..".selected_colors]
	
	camera_script = camera.get_script()
	
	camera.start_follow($play_character)
	
	plat_height_max = get_meta("PLAT_HEIGHT_MAX")
	plat_height_min = get_meta("PLAT_HEIGHT_MIN")
	plat_x_left = get_meta("plat_left_x")
	plat_x_right = get_meta("plat_right_x")


func _process(_delta):
	if player_dead:
		return
	playerY = $play_character.position.y


func player_die():
	print("Player Dead, Gameover.")
	player_dead = true


func _on_timer_timeout():
	var new_plat = plat_scene.instantiate()
	new_plat.set_name("Platform")
	
	var xspawn = plat_x_left
	var coinflip = randi() % 100
	if coinflip > 50:
		xspawn = plat_x_right
	
	var plat_spawn_location = Vector3(xspawn, randf_range(plat_height_min + playerY, plat_height_max + playerY), 0)
	var chosen_color = randi_range(0, selected_colors.size()-1)
	new_plat.initialize(plat_spawn_location, selected_colors[chosen_color])
	
	get_node("Platforms").add_child(new_plat)
	
	spawned_platform.emit(new_plat.get_script())

