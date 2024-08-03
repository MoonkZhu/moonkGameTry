extends "res://scripts/buildingEnterTrigger.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body: Node):
	# 调用父类的 _on_body_entered 方法
	super._on_body_entered(body)

	if body is CharacterBody2D:
		print("Special logic in child area")
