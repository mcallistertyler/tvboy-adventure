extends Area

func _on_Area_body_entered(body):
	if body.name == "Player":
		## touched by player so explode, increment counter once exists
		print("met player")
