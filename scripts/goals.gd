extends Node2D

signal player_score
signal cpu_score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goal_left_body_entered(body: Node2D) -> void:
	cpu_score.emit()


func _on_goal_right_body_entered(body: Node2D) -> void:
	player_score.emit()
