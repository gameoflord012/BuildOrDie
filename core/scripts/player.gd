extends KinematicBody2D

var speed: int
var direction: = Vector2(0, 0)
var velocity: = Vector2(0, 0)

func _init() -> void:
	speed = Globals.player_speed

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
	direction = Vector2( \
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), \
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))

func _physics_process(delta: float) -> void:
	input_handle()
	velocity = direction * speed
	print(delta)
	move_and_slide(velocity)
