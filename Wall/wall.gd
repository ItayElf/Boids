extends StaticBody2D

@export var dimentions = Vector2(100,100)

func _ready():
	$CollisionShape2D.shape.size = dimentions
	$Sprite2D.scale *= dimentions

