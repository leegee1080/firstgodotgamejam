extends Control



signal main_menu_signal_next_menu(next_menu_int)


func _on_play_button_button_up():
	main_menu_signal_next_menu.emit(-1)
	MasterScene.start_new_game()
	MasterScene.play_sound(3)


func _on_options_button_up():
	main_menu_signal_next_menu.emit(1)
	MasterScene.play_sound(2)


func _on_quit_button_up():
	MasterScene.play_sound(2)
	get_tree().quit()
