extends CanvasLayer

signal play_to_score_changed
signal cpu_difficulty_changed
signal close_settings

const easy := 0
const medium := 1
const hard := 2

var play_to := 7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_to_score_value_changed(value: float) -> void:
	play_to = int(value)
	$PlayToScore.value = value
	play_to_score_changed.emit(int(value))
	print(value)


func _on_easy_pressed() -> void:
	cpu_difficulty_changed.emit(easy)


func _on_medium_pressed() -> void:
	cpu_difficulty_changed.emit(medium)


func _on_hard_pressed() -> void:
	cpu_difficulty_changed.emit(hard)


func _on_close_settings_pressed() -> void:
	close_settings.emit()
