extends Node

class_name MenuController

enum Menus {Main, Options, Confirm, Pause, Credits}

@export_category("Order is: Main, Options, Confirm, Pause, Credits")
@export var menu_array: Array[Control]

var menu_dict
var current_menu

func _ready():
	
	menu_dict = {
		Menus.Main: menu_array[0],
		Menus.Options: menu_array[1],
		Menus.Confirm: menu_array[2],
		Menus.Pause: menu_array[3],
		Menus.Credits: menu_array[4],
	}
	
	current_menu = menu_dict[Menus.Main]


func change_menu(next_menu_enum):
	current_menu.set_visible(false)
	#menu_dict[next_menu_enum].visible = true
	#current_menu = menu_dict[next_menu_enum]


func _on_main_menu_container_main_menu_signal_next_menu():
	change_menu(Menus.Main)
