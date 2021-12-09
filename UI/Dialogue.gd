extends Control

var dialogue = []
var dialogue_queue = 0

signal finished

func _ready():
	hide()
	
func startD(d):
	dialogue = d.duplicate()
	dialogue_queue = 0
	show()
	
func hideD():
	dialogue = []
	dialogue_queue = 0
	hide()
	
func _physics_process(delta):
	if dialogue.size() and dialogue_queue < dialogue.size():
		var text = "[center]" + dialogue[dialogue_queue] + "[/center]"
		if $Text.bbcode_text != text:
			$Text.bbcode_text = text
		if Input.is_action_just_pressed("action"):
			dialogue_queue += 1
	elif dialogue.size():
		emit_signal("finished")
		hideD()
