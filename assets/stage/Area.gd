extends Area

signal playerDeath

func _on_Area_body_entered(body):
	if body.name == "Player":
		emit_signal("playerDeath")
	pass # Replace with function body.
