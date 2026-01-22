extends Sprite2D

const PADDLE_SPEED := 500

var play_to := 7
var cpu_difficulty := 1

var player_score := 0
var cpu_score := 0

const MAIN_MENU_BORDER_COLLISION_MASK := 3

var game_running := false

func _ready() -> void:
	$Player.hide()
	$Player/CollisionShape2D.disabled = true
	$CPU.hide()
	$CPU/CollisionShape2D.disabled = true
	$Ball.set_collision_mask_value(MAIN_MENU_BORDER_COLLISION_MASK, true)
	$Settings.hide()
	$Ball.create_ball()
	
func end_game() -> void:
	$Player.hide()
	$Player/CollisionShape2D.disabled = true
	$CPU.hide()
	$CPU/CollisionShape2D.disabled = true
	$Ball.set_collision_mask_value(MAIN_MENU_BORDER_COLLISION_MASK, true)
	$HUD/NewGameButton.show()
	$HUD/SettingsButton.show()
	game_running = false
	
func set_play_to(new_play_to: int) -> void:
	play_to = new_play_to

func _on_goals_cpu_score() -> void:
	cpu_score += 1
	check_end_game(cpu_score)
	$HUD/CPUScore.text = str(cpu_score)
	$BallTimer.start()

func _on_goals_player_score() -> void:
	check_end_game(player_score)
	player_score += 1
	$HUD/PlayerScore.text = str(player_score)
	$BallTimer.start()
	
func check_end_game(score: int) -> void:
	if score >= play_to:
		end_game()

func _on_ball_timer_timeout() -> void:
	if game_running:
		$Ball.set_collision_mask_value(MAIN_MENU_BORDER_COLLISION_MASK, false)
		$Ball.show()
		$Ball.create_ball()

func _on_hud_start_game() -> void:
	$HUD/NewGameButton.hide()
	$HUD/SettingsButton.hide()
	$Player.show()
	$CPU.show()
	$Player/CollisionShape2D.disabled = false
	$CPU/CollisionShape2D.disabled = false
	set_cpu_difficulty()
	game_running = true
	$Ball.hide()
	$BallTimer.start()

func set_cpu_difficulty() -> void:
	if cpu_difficulty == 1:
		$CPU.paddle_speed = 400
	elif cpu_difficulty == 2:
		$CPU.paddle_speed = 500
	else:
		$CPU.paddle_speed = 600

func _on_hud_show_settings() -> void:
	$HUD/SettingsButton.hide()
	$Settings.show()

func _on_settings_play_to_score_changed(value: int) -> void:
	play_to = value

func _on_settings_cpu_difficulty_changed(difficulty: int) -> void:
	cpu_difficulty = difficulty

func _on_settings_close_settings() -> void:
	$Settings.hide()
	$HUD/SettingsButton.show()
