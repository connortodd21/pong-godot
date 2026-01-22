extends StaticBody2D

var window_height : int
var paddle_center : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_height = int(get_viewport_rect().size.y)
	paddle_center = $ColorRect.size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	# restrict position to stay within window. We use paddle_center because the paddle is center anchored in the scene
	position.y = clamp(position.y, paddle_center.y, window_height - paddle_center.y)
