extends Popup

var player

func _ready():
	player = get_node("/root/Root/Player")
	set_process_input(false)

func _on_Player_player_level_up():
	$SoundLevelUp.play()
	set_process_input(true)
	popup_centered()
	get_tree().paused = true
	
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_A:
			player.health_max += 50
			player.health += 50
			after_input()		
		elif event.scancode == KEY_B:
			player.mana_max += 50
			player.mana += 50
			after_input()
			
			
func after_input():
	player.emit_signal("player_stats_changed", player)
	hide()
	set_process_input(false)
	get_tree().paused = false
