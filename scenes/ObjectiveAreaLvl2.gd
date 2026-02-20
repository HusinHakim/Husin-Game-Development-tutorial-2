extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "GreenShip"):
		print("Reached objective!")
