extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "Rabbit":
		if name == "Exit":
			var _target = get_tree().change_scene("res://Level2.tscn")
	if body.name == "Rabbit":
		if name == "Exit2":
			var _target = get_tree().change_scene("res://Level3.tscn")
