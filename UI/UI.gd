extends CanvasLayer

export var healing = 0.001

func _physics_process(delta):
	if $Dmg.color.a > 0:
		$Dmg.color.a -= healing

func add_dmg(d):
	$Dmg.color.a = clamp($Dmg.color.a + d, 0, 1)

func _on_Timer_timeout():
	if Global.timer > 0:
		Global.timer -= 1
		Global.update_time()
