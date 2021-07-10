extends Spatial

export var level : int

onready var timer = get_node("Timer")
onready var particles = get_node("Mesh/Particles")
onready var particles2 = get_node("Mesh/Particles2")
onready var woopsfx = get_node("WoopSFX")
signal enter_level

func _on_Area_body_entered(body):
	if body.name == "Player" && level > 0:
		timer.start()
		woopsfx.pitch_scale = 1.5
		particles.visible = false
		particles2.visible = true
		particles2.speed_scale = particles2.speed_scale * 1.5

func _on_Area_body_exited(body):
	if body.name == "Player":
		particles.speed_scale = 1
		woopsfx.pitch_scale = 1.0
		particles.visible = true
		particles2.visible = false
		timer.stop()


func _on_Timer_timeout():
	emit_signal("enter_level", level)
