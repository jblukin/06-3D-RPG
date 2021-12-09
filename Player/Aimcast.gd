extends RayCast

onready var Player = get_node("/root/Game/Player")

func _physics_process(delta):
	
	if is_colliding():
		Player.target = get_collider()
		var pos = get_collision_point()
		$Crosshair.global_transform.origin = pos	
	elif $Crosshair.translation != Vector3(0, 0, 30):
		$Crosshair.translation = Vector3(0, 0, 30)
		Player.target = null
