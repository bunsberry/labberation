extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/welcome_scene.tscn")

func _on_exit_pressed():
	get_tree().quit()
