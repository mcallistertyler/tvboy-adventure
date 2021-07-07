extends Label
var total_zines = 0

func _ready():
	var zines = get_tree().get_nodes_in_group("Zines")
	for zine in zines:
		zine.connect("zineCollected", self, "_on_zineCollected")
	text = String(total_zines)

func _on_zineCollected():
	total_zines += 1
	text = String(total_zines)
