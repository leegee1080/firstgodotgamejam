extends Control



signal credits_menu_signal_next_menu(next_menu_int)







func _on_back_button_up():
	credits_menu_signal_next_menu.emit(1)
