extends ColorRect
export var dialogPath = ""
export (float) var textSpeed = 0.05

var dialog
var phraseNum = 0
export var finished = false
signal dialogComplete(complete)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func supply_talking(npc_name):
	$Timer.wait_time = textSpeed
	dialog = getDialog(npc_name)
	assert(dialog, "Dialog not found")
	nextPhrase()

	
func _process(_delta):
	#$Indicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("dialogComplete", false)
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)

func getDialog(npc_name) -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "File path does not exist")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	var parsed_output = []
	for x in output:
		if x.Name == npc_name:
			parsed_output.append(x)
	if len(parsed_output) == 0:
		print("No dialog found for ", npc_name)
	if typeof(parsed_output) == TYPE_ARRAY:
		return parsed_output
	else:
		return []

func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		emit_signal("dialogComplete", true)
		queue_free()
		return
		
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
		
	finished = true
	phraseNum += 1
	return
