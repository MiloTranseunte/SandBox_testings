extends KinematicBody2D

const CANNON_BALL = preload("res://cannon_ball.tscn")
const KNIFE = preload("res://knife.tscn")

export (float) var angle = 45
export (float) var shoot_force = 50

export (float) var gravity = 20
export (float) var velocity = 20
export (Vector2) var motion = Vector2()

var facing = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += gravity * delta
	
	var knife_pos = 0 # $pos_left_cannon.global_position
	var knife = KNIFE
	
	motion.x = velocity * facing
	
	if !$ray_right.is_colliding():
		print("right not collide")
		facing = -1
	if !$ray_left.is_colliding():
		print("left not collide")
		facing = 1
	
	if is_on_wall():
		print("wall")
		motion.x = velocity * -1
	
	if Input.is_action_just_pressed("throw"): # SPACEBAR
		knife_pos = $pos_left_cannon.global_position
		knife = KNIFE.instance()
		get_parent().add_child(knife)
		knife.position = knife_pos
		knife.launch(-1)
		
		
		knife_pos = $pos_right_cannon.global_position
		knife = KNIFE.instance()
		get_parent().add_child(knife)
		knife.position = knife_pos
		knife.launch(1)
		
		knife.beforeVanish()
		
	motion = move_and_slide(motion, Vector2(0, -1))