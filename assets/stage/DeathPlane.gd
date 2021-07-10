extends Spatial

signal playerDeath

func _on_Area_body_entered(body):
	if body.name == "Player":
		emit_signal("playerDeath")
		get_tree().reload_current_scene() ## literally reload the entire scene, nothing else
