extends CharacterBody2D

var speed := 150.0
var acceleration := 500.0
var difficulty := 0.8
var reaction_time := 0.3
var current_velocity := 0.0
var reaction_timer := 0.0

@onready var ball = get_parent().find_child("Ball")
@onready var viewport_width := get_viewport_rect().size.x

func _process(delta: float) -> void:
	if not ball:
		return
	
	# Reaction time delay
	reaction_timer -= delta
	if reaction_timer <= 0 and abs(ball.position.x - position.x) > 10:
		reaction_timer = randf_range(0.1, reaction_time)
	
	# Target position với sai số
	var target = ball.position.x + randf_range(-50, 50) * (1.0 - difficulty)
	var direction = sign(target - position.x)
	
	# Smooth acceleration/deceleration
	current_velocity = move_toward(current_velocity, direction * speed, acceleration * delta)
	position.x = clamp(position.x + current_velocity * delta, 0, viewport_width)
