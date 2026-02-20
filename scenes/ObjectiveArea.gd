extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		# Objective level 1 tercapai -> lanjut ke level 2.
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
