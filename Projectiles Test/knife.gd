extends KinematicBody2D

const THROW_VELOCITY = Vector2(300, -200)
#						Vector angle.y * magnitud, angle.y * magnitud
export (float) var angle = deg2rad(2574)
var force = 1
var gravity = 300
var velocity = Vector2.ZERO

# to take on acount: get_viewport().get_mouse_position()

var absoluteValue = Vector2.ZERO

func beforeVanish():
	$Timer.start()

func _physics_process(delta):
	var angles = Vector2(1, -11)#.angle()
	#print(rad2deg(angles))
	absoluteValue = angles.abs()
	#print(rad2deg(absoluteValue.angle()))
	
	
	velocity.y += gravity * delta
	#velocity.x = clamp(velocity.x, 10, 1000)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision != null:
		_on_impact(collision.normal)
	
	pass


func launch(direction):
	velocity = THROW_VELOCITY * Vector2(direction, 1) # Vector2(direction, 1) es para dar vuelta el Vector, es como decir velocity = velocity * direction (-1 or 1)
	
func _on_impact(normal : Vector2):
	velocity = velocity.bounce(normal)
	velocity *= 0.5 + rand_range(-0.05, 0.05)
	pass

func _on_Timer_timeout():
	print("Knives out!")
	queue_free()
