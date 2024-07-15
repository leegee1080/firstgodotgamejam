extends Node3D

class_name SoundController

@export var sound_array: Array[AudioStreamWAV]


func play_sound(sound_index: int):
	$AudioStreamPlayer3D.stream = sound_array[sound_index]
	$AudioStreamPlayer3D.play()
