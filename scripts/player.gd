extends StaticBody2D

var window_height : int
var paddle_center : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_height = int(get_viewport_rect().size.y)
	paddle_center = $ColorRect.size.y / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	position.y = clamp(position.y, paddle_center, window_height - paddle_center)
