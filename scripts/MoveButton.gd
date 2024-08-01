# MainButton.gd
extends Button

@export var player: NodePath
@export var move_to_position: Vector2

func _ready():
	# Disconnect existing connection (if any)
	if is_connected("pressed", Callable(self, "_on_pressed")):
		disconnect("pressed", Callable(self, "_on_pressed"))

	# Connect the signal
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	var player_node = get_node(player) as CharacterBody2D
	if player_node:
		# Set player target position
		player_node.set_target_position($"..".position)
