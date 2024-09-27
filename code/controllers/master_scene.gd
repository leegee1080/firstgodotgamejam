extends Node3D

#COLOR VARS
enum color_set_names_enum {NORMAL, BW}
var avail_colors_dict = {
	color_set_names_enum.NORMAL: [Color.RED, Color.BLUE, Color.YELLOW],
	color_set_names_enum.BW: [Color.BLACK, Color.DIM_GRAY, Color.WHITE], 
}
var selected_colors: color_set_names_enum = color_set_names_enum.NORMAL
#COLOR VARS END

@export var menu_control: MenuController
@export var camera: Camera3D

@export var game_scene: PackedScene

@export var sound_controller: SoundController

func _ready():
	pass

func start_new_game():
	var new_game = game_scene.instantiate()
	self.add_child(new_game)

func play_sound(sound_index: int):
	sound_controller.play_sound(sound_index)

func change_fx_volume(new_volume):
	sound_controller.change_fx_volume(new_volume)

func change_music_volume(new_volume):
	sound_controller.change_music_volume(new_volume)

func save_game(save_dict):
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(save_dict)
	# Store the save dictionary as a new line in the save file.
	save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()


func create_save_dict():
	var save_dict = {
		"fx_vol" : sound_controller.fx_volume,
		"mus_vol" : sound_controller.music_volume,
	}
	return save_dict
