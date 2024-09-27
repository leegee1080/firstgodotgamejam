extends Node3D

class_name SoundController

@export var sound_array: Array[AudioStreamWAV]
@export var music_array: Array[AudioStreamWAV]

var fx_volume = 100
var music_volume = 100



func play_sound(sound_index: int):
	$FX_Container/AudioStreamPlayer3D.stream = sound_array[sound_index]
	$FX_Container/AudioStreamPlayer3D.play()
	
func play_music(music_index: int):
	$Music_Container/MusicStreamPlayer.stream = music_array[music_index]
	$Music_Container/MusicStreamPlayer.play()

func change_fx_volume(new_volume):
	$FX_Container/AudioStreamPlayer3D.volume_db = new_volume
	fx_volume = new_volume

func change_music_volume(new_volume):
	$Music_Container/MusicStreamPlayer.volume_db = new_volume
	music_volume = new_volume
