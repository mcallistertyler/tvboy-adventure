extends Area

var active = false
var npc_name = "Debug Sign"
var dialogScene = preload("res://dialog/Dialog.tscn")

func _ready():
	print("world ready")
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")

func _input(event):
	if get_node_or_null("DialogBox") == null:
		if event.is_action_pressed("talk") and active:
			var dialogBox = dialogScene.instance()
			add_child(dialogBox)
			dialogBox.get_node("DialogBox").supply_talking(npc_name)


func _on_NPC_body_entered(body):
	print("Enter sign area")
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	print("Exit sign area")
	if body.name == 'Player':
		active = false 
