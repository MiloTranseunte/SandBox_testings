extends KinematicBody2D

const THROW_VELOCITY = Vector2(300, -200)
export (float) var angle = rad2deg(45)
var force = 1
var gravity = 300
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	#velocity.x = clamp(velocity.x, 10, 1000)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision != null:
		_on_impact(collision.normal)
	
		
func launch(direction):
	velocity = THROW_VELOCITY * Vector2(direction, 1) # Vector2(direction, 1) es para dar vuelta el Vector, es como decir velocity = velocity * direction (-1 or 1)
	
func _on_impact(normal : Vector2):
	velocity = velocity.bounce(normal)
	velocity *= 0.5 + rand_range(-0.05, 0.05)
	pass