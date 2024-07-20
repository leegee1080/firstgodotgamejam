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
