extends Node2D

@onready var ball = $Ball
@onready var viewport_center = get_viewport_rect().size / 2

var scoremain := 0
var scoreenemy := 0

func _reset_ball() -> void:
	ball.position = viewport_center
	ball.velocity = Vector2.from_angle(randf() * TAU) * ball.speed

func _on_goal_main_body_entered(_body: Node2D) -> void:
	scoreenemy += 1
	$ScoreEnemy.text = str(scoreenemy)
	_reset_ball()

func _on_goal_enemy_body_entered(_body: Node2D) -> void:
	scoremain += 1
	$ScoreMain.text = str(scoremain)
	_reset_ball()
