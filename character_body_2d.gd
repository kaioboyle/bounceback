extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5
var rotation_direction = 0
var onGround = false


func get_input():
	rotation_direction = Input.get_axis("left", "right")

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	if onGround:
		velocity.y += 50 * delta
		onGround = false
	
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func _on_pogo_point_body_entered(body: Node2D) -> void:
	onGround = true
