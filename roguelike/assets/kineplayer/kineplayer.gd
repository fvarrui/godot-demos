extends KinematicBody2D

export var speed = 6000

func _ready():
	$sprite.animation = "default"
	
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("player_up"):
		motion  += Vector2(0,-1)
		$sprite.animation = "up"
	if Input.is_action_pressed("player_down"):
		motion  += Vector2(0,1)
		$sprite.animation = "down"
	if Input.is_action_pressed("player_left"):
		motion  += Vector2(-1,0)
		$sprite.animation = "left"
	if Input.is_action_pressed("player_right"):
		motion  += Vector2(1,0)
		$sprite.animation = "right"
	motion += motion.normalized() * delta * speed
	move_and_slide(motion)
	OS.execute()
