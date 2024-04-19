extends StaticBody2D

@export var dimentions = Vector2(100,100)

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.shape.size = dimentions
	$Sprite2D.scale *= dimentions


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
