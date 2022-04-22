extends ColorRect

func _on_Player_player_stats_changed(var player):
	$Value.text = str(player.mana_potions)
