extends CharacterBody2D

@export var speed : float = 400
@export var rotation_speed : float = 1.5
var rotation_direction = 0


func get_input():
	rotation_direction = Input.get_axis("left", "right")

func _physics_process(delta):
	var pogo_dir : Vector2 = ($pogoPoint.global_position - global_position).normalized()
	
	if not $pogoPoint.has_overlapping_areas():
		velocity += get_gravity() * delta
	else:
		velocity -= 10000 * delta * pogo_dir
	
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
