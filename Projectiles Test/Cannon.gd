extends KinematicBody2D

const CANNON_BALL = preload("res://cannon_ball.tscn")
const KNIFE = preload("res://knife.tscn")

export (float) var angle = 45
export (float) var shoot_force = 50

export (float) var gravity = 100
export (float) var velocity = 20
export (Vector2) var motion = Vector2()

var facing = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y -= gravity * delta # or motion.y += gravity * delta
	
	if is_on_ceiling():
		print("on_ceiling")
		if !$ray_left.is_colliding() or !$ray_right.is_colliding():
			print("some ray is not colliding")
			facing *= -1

	motion.x = velocity * facing

	var knife_pos = 0 # $pos_left_cannon.global_position
	var knife = KNIFE
	
	if Input.is_action_just_pressed("throw"): # SPACEBAR
		var _shoot_direction = -1 # negative left
		knife_pos = $pos_left_cannon.global_position
		knife = KNIFE.instance()
		get_parent().add_child(knife)
		knife.position = knife_pos
		knife.launch(_shoot_direction)
		
		knife.beforeVanish()
		
		_shoot_direction *= -1 # EQUALS TO +1 positive right
		knife_pos = $pos_right_cannon.global_position
		knife = KNIFE.instance()
		get_parent().add_child(knife)
		knife.position = knife_pos
		knife.launch(_shoot_direction)
		
		knife.beforeVanish()
		
	motion = move_and_slide(motion, Vector2(0, -1))
		
	if is_on_wall():
		print("wall")
		facing *= -1