extends Node

@export var sensitivity = 1000
@export var players: Array[CharacterBody3D]
@export var cameraPivots: Array[Node3D]

@export var speed = 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	for player in players:
		if not player.is_on_floor():
			player.velocity.y -= gravity * delta

		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			player.velocity.x = direction.x * speed
			player.velocity.z = direction.z * speed
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, speed)
			player.velocity.z = move_toward(player.velocity.z, 0, speed)

		player.move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		for player in players: # and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			player.rotation.y -= event.relative.x / sensitivity
		
		for cameraPivot in cameraPivots:
			cameraPivot.rotation.x -= event.relative.y / sensitivity
			cameraPivot.rotation.x = clamp(cameraPivot.rotation.x, deg_to_rad(-45), deg_to_rad(90))
