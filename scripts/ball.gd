extends CharacterBody2D

var speed := 300.0
@onready var play_paddle = get_parent().find_child("PlayPaddle")
@onready var enemy_paddle = get_parent().find_child("EnemyPaddle")

func _ready() -> void:
	var angle = randf_range(PI / 6, 5 * PI / 6) if randf() > 0.5 else randf_range(7 * PI / 6, 11 * PI / 6)
	velocity = Vector2.from_angle(angle) * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == play_paddle or collider == enemy_paddle:
			var paddle_width = 100.0
			var hit_pos = clamp((position.x - collider.position.x) / paddle_width, -0.5, 0.5)
			var angle_offset = hit_pos * PI / 2.5
			var base_angle = -PI / 2 if collider == play_paddle else PI / 2
			velocity = Vector2.from_angle(base_angle + angle_offset) * speed
		else:
			velocity = velocity.bounce(collision.get_normal()).normalized() * speed
