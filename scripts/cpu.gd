extends StaticBody2D

var ball_position : Vector2
var distance_from_paddle : float
var move_by : float
var window_height : Vector2
var paddle_center : Vector2
var paddle_speed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_height = get_viewport_rect().size
	paddle_center = $ColorRect.size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_position = $"../Ball".position
	distance_from_paddle = position.y - ball_position.y
	
	if abs(distance_from_paddle) > (paddle_speed * delta):
		move_by = paddle_speed * delta * (distance_from_paddle / (abs(distance_from_paddle)))
	else:
		move_by = distance_from_paddle
		
	position.y = clamp(position.y - move_by, paddle_center.y / 2, window_height.y - (paddle_center.y - 2))
