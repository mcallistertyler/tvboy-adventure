extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var npc_name = "TV Dude #2"
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")

func _on_NPC_body_entered(body):
	print("Enter npc area")
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	print("Exit npc area")
	if body.name == 'Player':
		active = false 
