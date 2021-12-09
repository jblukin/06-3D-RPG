extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = ["Welcome to the game, press E to continue", 
"Be quick or you may not make it out alive", 
"Shoot all 4 targets before you run out of time", 
"The challenge begins once you press E!"]


func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished", self, "done")

func _on_Area_body_entered(body):
	Dialogue.startD(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hideD()
	
func done():
	get_node("/root/Game/Target_Container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
