extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@onready var buildings = $"."
@onready var area_2d = $Area2D



func _on_area_2d_area_entered(area):
	print("hello entering")
	pass # Replace with function body.
