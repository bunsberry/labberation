extends Control

func _on_continue_pressed():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Engine.time_scale = 1


func _on_quit_pressed():
	get_tree().quit()
