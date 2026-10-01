extends Node2D

const SPEED = 30

# Positive Direction will go to 'x' axis and Negative to opposite direction
var direction = 1

# raycast is used to know the first collision object it intersects.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight


# Called every physics frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	position.x += SPEED * delta * direction
	animated_sprite.flip_h = direction < 0
