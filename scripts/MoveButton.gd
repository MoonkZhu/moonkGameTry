extends Button

# Reference to the player node
@export var player: NodePath
# Target position to move the player to
@export var move_to_position: Vector2

func _ready():
	# 首先断开已经存在的连接（如果有）
	if is_connected("pressed", Callable(self, "_on_pressed")):
		disconnect("pressed", Callable(self, "_on_pressed"))

	# 然后连接信号
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	var player_node = get_node(player) as CharacterBody2D
	if player_node:
		player_node.target_position = move_to_position
