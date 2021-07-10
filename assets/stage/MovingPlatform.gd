extends KinematicBody

export (float) var time = 5.0
export (Vector3) var direction = Vector3(1,0,0)
export (float) var speed = 1.5
export (float) var delayTime = 1.5
export (bool) var playerAction = false
export (float) var timedPlayerAction = 0.0

var places = []

var timer : Timer
var timeUp : bool
var delay : Timer
var delayUp : bool


var actualVelocity := Vector3()
var stop = false
var isMoving = true
var velocity

func _ready():
	timer = createTimer(time, "timeUp")
	delay = createTimer(delayTime, "delayUp")
	
	timeUp = true
	delayUp = true
	
	add_child(timer)
	add_child(delay)
	velocity = direction.normalized() * speed
	
	places.append(global_transform.origin)
	places.append(global_transform.origin + (direction.normalized() * speed * time))

func timeUp():
	timeUp = true

func delayUp():
	delayUp = true

func createTimer(wait_time : float, funcTarget : String):
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(wait_time)
	timer.connect("timeout", self, funcTarget)
	return timer

func handle_movement(delta):
	var pos1 = global_transform.origin
	if timeUp && delayUp && stop == false:
		timer.start()
		timeUp = false
		stop = true
		isMoving = true
		velocity *= -1
	elif timeUp && delayUp && stop == true:
		delay.start()
		delayUp = false
		stop = false
		isMoving = false
		var place1 = (global_transform.origin - places[0]).length()
		var place2 = (global_transform.origin - places[1]).length()
		if (place1 < place2):
			global_transform.origin = places[0]
		else:
			global_transform.origin = places[1]
	
	if(isMoving):
		global_transform.origin -= velocity * delta
	
	var pos2 = global_transform.origin
	actualVelocity = (pos2 - pos1) / delta

func _physics_process(delta):
	handle_movement(delta)
