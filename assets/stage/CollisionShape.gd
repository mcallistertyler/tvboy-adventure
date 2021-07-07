extends CollisionShape

onready var mesh_instance = get_node("./MeshInstance")

func _ready():
	print("Collision shape created")
	var parent = get_parent()
	print(mesh_instance)
