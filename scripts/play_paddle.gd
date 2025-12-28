extends StaticBody2D

var speed := 200.0
@onready var viewport_width := get_viewport_rect().size.x

func _process(delta: float) -> void:
	var dir = Input.get_action_strength("D") - Input.get_action_strength("A")
	if dir:
		position.x = clamp(position.x + dir * speed * delta, 0, viewport_width)
