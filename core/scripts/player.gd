extends Node

func _ready() -> void:
	if !owner : _start()
	else :
		set_physics_process(false)
		set_process(false)

func _start() -> void:
	set_physics_process(true)
	set_process(true)
