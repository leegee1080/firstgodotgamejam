extends Control



signal main_menu_signal_next_menu(next_menu_int)


func _on_play_button_button_up():
	main_menu_signal_next_menu.emit(-1)
	MasterScene.start_new_game()


func _on_options_button_up():
	print("options")
	main_menu_signal_next_menu.emit(1)


func _on_quit_button_up():
	get_tree().quit()
