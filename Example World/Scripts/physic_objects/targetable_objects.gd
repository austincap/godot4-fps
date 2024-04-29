extends RigidBody3D

var selfscene = preload("res://Example World/Objects/World/boxxy.tscn")

var Health = 20

func tinify(earlierBlocksScale):
	var instance1 = self.duplicate()
	instance1.basis.scaled(Vector3(0.5, 0.5, 0.5))
	instance1.global_transform.origin = self.global_transform.origin
	get_tree().current_scene.add_child(instance1)
	var instance2 = self.duplicate()
	instance2.basis.scaled(Vector3(0.5, 0.5, 0.5))
	instance2.global_transform.origin = self.global_transform.origin
	get_tree().current_scene.add_child(instance2)
	self.queue_free()

func Hit_Successful(Damage, _Direction: Vector3 = Vector3.ZERO, _Position: Vector3 = Vector3.ZERO):
	var Hit_Position = _Position - get_global_transform().origin 
	Health -= Damage
	#print("HIT")
	if Health <= 0:
		tinify(self.scale)
	if _Direction != Vector3.ZERO:
		apply_impulse((_Direction*Damage),Hit_Position)
