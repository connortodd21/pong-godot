extends CharacterBody2D

var window_size : Vector2

const START_SPEED := 500
const ACCELERATION := 50
var speed : int = 0
var direction : Vector2
const MAX_Y_VECTOR := 0.6


func _ready() -> void:
	window_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../CPU":
			speed += ACCELERATION
			direction = bounce_off_paddle(collider)
		else:
			direction = direction.bounce(collision.get_normal())

func bounce_off_paddle(collider) -> Vector2:
	var ball_hit_location = position.y - collider.position.y
	var bounce_direction := Vector2()
	bounce_direction.x = -1 if direction.x > 0 else 1
	bounce_direction.y = (ball_hit_location / (collider.paddle_center.y / 2)) * MAX_Y_VECTOR
	return bounce_direction.normalized()
	
func create_ball() -> void:
	position.x = window_size.x / 2
	position.y = randi_range(200, int(window_size.y) - 200)
	speed = START_SPEED
	direction = get_random_direction()

func get_random_direction() -> Vector2:
	var direction_range = [-1,1]
	return Vector2(direction_range.pick_random(), randf_range(direction_range[0], direction_range[1])).normalized()
