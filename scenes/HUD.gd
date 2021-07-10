extends Control
signal level_complete

func _on_Counter_all_collected():
	emit_signal("level_complete")
	pass # Replace with function body.
