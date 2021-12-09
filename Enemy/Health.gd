extends ProgressBar

func _physics_process(delta):
	value = get_node("/root/Game/Drone_Container/Drone").health
	
