extends Node2D

func pause(mode: bool):
	set_physics_process(!mode)
	set_process(!mode)
	set_process_unhandled_input(!mode)

func _ready() -> void:
	if !owner : start()
	else :
		pause(true)

func start() -> void:
	pause(false)

func input_handle() -> void:
	var mouse_position: = get_local_mouse_position() - position	
	mouse_position = mouse_position.normalized()
	print(mouse_position)
	
	var rotation_angle = -1
	if mouse_position.y < 0:
		rotation_angle = mouse_position.dot(Vector2(1, 0)) * 90
	else:
		var dot = mouse_position.dot(Vector2(1, 0))
		rotation_angle = 90 + (1 - dot) * 90
		
	rotation_degrees = mouse_position.dot(Vector2(1, 0)) * 90
	
func _physics_process(delta: float) -> void:
	input_handle()
