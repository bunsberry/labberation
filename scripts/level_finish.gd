extends Label

var timer_count = 0

@export var labels: Array[String]
@export var scene_file: String

func _ready():
	text = labels[0]

func _on_timer_timeout():
	timer_count += 1
	if timer_count < labels.size():
		text = labels[timer_count]
	else:
		get_tree().change_scene_to_file(scene_file)
	
