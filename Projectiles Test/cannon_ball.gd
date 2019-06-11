extends KinematicBody2D

var gravity = 100

var velocity = Vector2()
var shoot_strenght = 0.0
var angle = 0
var launch_position = Vector2()

var motion = Vector2()
"""
func calcular_tiro(directional_force : int, angle, GRAVITY, launch_position : Vector2, initial_position : Vector2, time):
	
	var final_math = Vector2()
	var dtx = 0
	var dty = 0
	# descomponer las velocidades en eje X e Y:
	initial_position.x = directional_force * cos(angle)
	initial_position.y = directional_force * sin(angle)
	
	dtx = launch_position.x + initial_position.x * time
	dty = launch_position.y + initial_position.y + (GRAVITY/2) * pow(time,2)
	
	final_math = initial_position
	return final_math
"""

func set_angle(value):
	angle = rad2deg(value)
	pass

func set_shoot_force(shoot_force):
	shoot_strenght = shoot_force
	pass

func _ready():
	pass
	
func set_launch_position(value : Vector2):
	launch_position = value
	pass
	
var shoot_angle = 0 #45
var init_velocity = 100
var _gravity = 9.8
var dt = 0.1
var gun_pos= Vector2(30,570)

func ballist():
	#descomposición de velocidades
	var Vx = init_velocity*cos(shoot_angle)
	var Vy = init_velocity*sin(shoot_angle)
	
	var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity 
	
	var T = 2*init_velocity*sin(shoot_angle)/gravity #altura máxima
	
	for t in range(T/dt+1):
		var X = Vx * t * dt
		var Y = Vy * t * dt - gravity * pow(t*dt,2) / 2
		
	var motionV = Vector2(Vx,Vy)
	return motionV

func _physics_process(delta):
	
	#var final_math = Vector2()
	#var dtx = 0
	#var dty = 0
	
	# descomponer las velocidades en eje X e Y:
	velocity.x = shoot_strenght * cos(angle)
	velocity.y = shoot_strenght * sin(angle)
	
	var T = 2*shoot_strenght*sin(angle)/gravity #altura máxima
	
	motion.x += launch_position.x + velocity.x * delta
	motion.y += launch_position.y + velocity.y + sin(2*gravity) * delta
	
	move_and_collide(motion * delta)
	
	pass
