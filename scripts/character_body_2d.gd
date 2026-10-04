extends CharacterBody2D

var character_direction : Vector2
var character_speed := 9000
 
# the "\" just breaks this long line of code to snipets. probably bad practice lol
# really cool. so if any of the movement buttons are pressed, set the x of the direction to 
# the axis of the move_left and move_right button and set the y of the direction to up and down
# the axis of this inputs is either (1,0) (0,1) (-1,0) (0,-1)
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left") or\
	Input.is_action_pressed("move_right") or\
	Input.is_action_pressed("move_up") or\
	Input.is_action_pressed("move_down"):
		character_direction.x = Input.get_axis("move_left", "move_right")
		character_direction.y = Input.get_axis("move_up", "move_down")
		
		character_direction = character_direction.normalized()
		
		velocity = character_direction * character_speed * delta
	else: # this else means if nothing is being pressed, stop the character from moving instead of sliding infinitely
		velocity = Vector2.ZERO
	
	move_and_slide()
