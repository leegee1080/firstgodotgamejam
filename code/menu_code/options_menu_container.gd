extends Control



signal options_menu_signal_next_menu(next_menu_int)




func _on_volume_button_up():
	options_menu_signal_next_menu.emit(5)
	MasterScene.play_sound(2)


func _on_back_button_up():
	options_menu_signal_next_menu.emit(0)
	MasterScene.play_sound(2)


func _on_credits_button_up():
	options_menu_signal_next_menu.emit(4)
	MasterScene.play_sound(2)
