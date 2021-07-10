extends Spatial

const first_level = preload("res://scenes/FirstLevel.tscn")

const level_list = {
	1: first_level
}

func _ready():
	var warps = get_tree().get_nodes_in_group("Warps")
	if warps.size() >= 1:
		for warp in warps:
			warp.connect("enter_level", self, "_on_enter_level")
		

func _on_enter_level(level):
	if level_list[level] != null:
		get_parent().add_child(level_list[level].instance())
		queue_free()
