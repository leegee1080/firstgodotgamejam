extends Node

class_name MenuController

enum Menus {Main, Options, Confirm, Pause, Credits}

@export var menu_array: Array[Control]

var menu_dict

func _ready():
	
	menu_dict = {
	Menus.Main: menu_array[0],
	Menus.Options: menu_array[1],
	Menus.Confirm: menu_array[2],
	Menus.Pause: menu_array[3],
	Menus.Credits: menu_array[4],
}
