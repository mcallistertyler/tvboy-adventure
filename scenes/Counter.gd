extends Label

var collected_zines = 0
var total_zines = 0

signal all_collected

func _ready():
	var zines = get_tree().get_nodes_in_group("Zines")
	total_zines = zines.size()
	for zine in zines:
		zine.connect("zineCollected", self, "_on_zineCollected")
	text = String(collected_zines)

func _on_zineCollected():
	collected_zines += 1
	text = String(collected_zines)
	if collected_zines == total_zines and total_zines > 0:
		emit_signal("all_collected")
