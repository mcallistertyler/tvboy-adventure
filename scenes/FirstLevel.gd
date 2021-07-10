extends Spatial

const credits = preload("res://credits/GodotCredits.tscn")

func _ready():
	var completionSignal = get_tree().get_root().find_node("HUD", true, false)
	if completionSignal != null:
		completionSignal.connect("level_complete", self, "_on_complete")

func _on_complete():
	print("Damn he's good")
	get_parent().add_child(credits.instance())
	queue_free()
