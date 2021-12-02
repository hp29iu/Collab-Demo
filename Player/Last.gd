extends Area2D





func _on_Last_body_entered(body):
	if body.name == "Rabbit":
		if name == "Last":
			var _target = get_tree().change_scene("res://UI/TheEnd.tscn")
