extends CharacterBody2D

@export var speed: float = 200.0

# A vector to store the touch input direction
var input_vector = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Move the character based on the input vector
	if input_vector != Vector2.ZERO:
		# Normalize the vector to prevent faster diagonal movement
		input_vector = input_vector.normalized()
		# Set the velocity and move the character
		velocity = input_vector * speed
	else:
		# Stop the character if there's no input
		velocity = Vector2.ZERO

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	# Check for touch input
	if event is InputEventScreenTouch:
		if event.pressed:
			# Touch press: calculate direction from the character to touch point
			input_vector = (event.position - global_position).normalized()
		else:
			# Touch release: reset input vector to stop the character
			input_vector = Vector2.ZERO
	elif event is InputEventScreenDrag:
		# While dragging, update the direction
		input_vector = (event.position - global_position).normalized()
