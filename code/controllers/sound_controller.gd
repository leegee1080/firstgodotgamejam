extends Node3D

class_name SoundController

@export var sound_array: Array[AudioStreamWAV]

var fx_volume = 100
var music_volume = 100



func play_sound(sound_index: int):
	$AudioStreamPlayer3D.stream = sound_array[sound_index]
	$AudioStreamPlayer3D.play()

func change_fx_volume(new_volume):
	$AudioStreamPlayer3D.volume_db = new_volume
	fx_volume = new_volume

func change_music_volume(new_volume):
	music_volume = new_volume
