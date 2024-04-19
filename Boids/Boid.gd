extends CharacterBody2D

@export var speed: int = 200
@export var wall_vision_length: int = 50

const MIN_WALL_VIEW_RANGE = -135
var direction = Vector2.UP

func _ready():
	$Sprite2D.modulate = Color("#6291D5").darkened(randfn(0,0.4))

func _avoid_walls(angle: int):
	var space_state = get_world_2d().direct_space_state
	var angled_vector = Vector2.from_angle(deg_to_rad(angle - 90))
	var query = PhysicsRayQueryParameters2D.create(
		global_position,
		global_position + (angled_vector * wall_vision_length)
	)
	
	var result = space_state.intersect_ray(query)
	if result.is_empty():
		direction = angled_vector
		return true
	return false

func avoid_walls():
	for i in range(0, MIN_WALL_VIEW_RANGE - 5, -5):
		if _avoid_walls(i) or _avoid_walls(-i):
			return


func _physics_process(_delta):
	avoid_walls()
	
	velocity = direction * speed
	$Sprite2D.rotation = direction.angle() + PI/2
	move_and_slide()
