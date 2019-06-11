extends KinematicBody2D

const CANNON_BALL = preload("res://cannon_ball.tscn")
const KNIFE = preload("res://knife.tscn")

export (float) var angle = 45
export (float) var shoot_force = 50

var facing = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var cannon_bal_pos = $Position2D.global_position
	var cannon_ball = CANNON_BALL
	
	var knife_pos = $Position2D.global_position
	var knife = KNIFE
	
	if Input.is_action_just_pressed("shoot"): # SPACEBAR
		print("shoot")
		cannon_ball = CANNON_BALL.instance()
		get_parent().add_child(cannon_ball)
		cannon_ball.position = cannon_bal_pos
		
		cannon_ball.set_angle(angle)
		cannon_ball.set_shoot_force(shoot_force)
		cannon_ball.set_launch_position(self.global_position)
		
	if Input.is_action_just_pressed("throw"): # SPACEBAR
		print("throw")
		knife = KNIFE.instance()
		get_parent().add_child(knife)
		knife.position = knife_pos
		knife.launch(facing)