extends Control



signal main_menu_signal_next_menu()


func _on_play_button_button_up():
	main_menu_signal_next_menu.emit()
	MasterScene.start_new_game()


func _on_options_button_up():
	print("options")


func _on_quit_button_up():
	print("quit")
