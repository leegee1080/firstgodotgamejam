extends Control



signal volume_menu_signal_next_menu(next_menu_int)





func _on_back_button_up():
	volume_menu_signal_next_menu.emit(0)



func _on_fx_slider_value_changed(value):
	pass # Replace with function body.


func _on_music_slider_value_changed(value):
	pass # Replace with function body.
