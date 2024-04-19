extends CharacterBody2D

@export var speed = 30

var direction = Vector2.UP * 10

func _ready():
	$Sprite2D.modulate = Color("#6291D5").darkened(randfn(0,0.4))


func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
