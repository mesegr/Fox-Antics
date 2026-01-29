extends CharacterBody2D


class_name Player


@onready var player_sprite: Sprite2D = $PlayerSprite


const GRAVITY: float = 690
const JUMP_SPEED: float = -270
const RUN_SPEED: float = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_SPEED
		
	velocity.x = RUN_SPEED * Input.get_axis("left","right")
	player_sprite.flip_h = true if velocity.x < 0 else false
	
	move_and_slide()
