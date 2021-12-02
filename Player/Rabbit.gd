extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -730

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.1)
	
	#if coins == 5:
		#get_tree().change_scene("res://Level2.tscn")
	#elif coins == 4:
		#get_tree().change_scene("res://Level3.tscn")
		


func _on_Fallzone_body_entered(body):
	get_tree().reload_current_scene()

func add_coin():
	coins += 1

func ouch(enemyposx):
	set_modulate(Color(1,0.3,0.3,0.8))
	velocity.y = JUMPFORCE * 0.7
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()


func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
