extends Control



signal options_menu_signal_next_menu(next_menu_int)



func _on_colors_button_up():
	print("color")


func _on_volume_button_up():
	print("volume")


func _on_back_button_up():
	options_menu_signal_next_menu.emit(0)
	print("back")
