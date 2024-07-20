extends Node

class_name MenuController

enum Menus {Main, Options, Confirm, Pause, Credits, Volume}

@export_category("Order is: Main, Options, Confirm, Pause, Credits, Volume")
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
		Menus.Volume: menu_array[5],
	}
	current_menu = menu_dict[Menus.Main]


func change_menu(next_menu_enum):
	current_menu.set_visible(false)
	if next_menu_enum == null or next_menu_enum == -1:
		return
	menu_dict[next_menu_enum].visible = true
	current_menu = menu_dict[next_menu_enum]


func _on_main_menu_container_main_menu_signal_next_menu(next_menu_int):
	change_menu(next_menu_int)


func _on_options_menu_controller_options_menu_signal_next_menu(next_menu_int):
	change_menu(next_menu_int)


func _on_credits_menu_controller_credits_menu_signal_next_menu(next_menu_int):
	change_menu(next_menu_int)


func _on_volume_menu_controller_volume_menu_signal_next_menu(next_menu_int):
	change_menu(next_menu_int)
