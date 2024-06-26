extends Node3D

var plat_height_max
var plat_height_min
var plat_x_left
var plat_x_right

var playerY
var player_dead = false

var camera: Node3D
var camera_script

@export var plat_scene: Array[PackedScene]
@export var starting_platform: Node3D

var selected_colors
signal spawned_platform(Platform)


func _ready():
	
	camera = $"..".camera
	
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
	camera.go_home()
	var MC: MenuController = get_parent().get_node("MenuController")
	MC.change_menu(MC.Menus.Main)
	self.queue_free()


func _on_timer_timeout():
	if player_dead:
		return
	var new_plat
	
	var odd_block_chance = randi_range(0, 100)
	if odd_block_chance > 90:
		var r = randi_range(0, plat_scene.size()-1)
		new_plat = plat_scene[r].instantiate()
	
	new_plat = plat_scene[0].instantiate()
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
