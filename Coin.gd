extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	body.add_coin()
	emit_signal("coin_collected")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

	
