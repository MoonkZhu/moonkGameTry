extends CharacterBody2D

# Constants for movement and jump
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 0
# Movement speed for non-jump actions
@export var speed: float = 200.0

# Target position for the player to move to
var target_position: Vector2 = Vector2.ZERO

# Reference to the AnimationPlayer node
var anim_player: AnimationPlayer

func _ready():
	anim_player = $AnimationPlayer

func _physics_process(delta):
	var velocity = Vector2.ZERO

	# 检查输入来更新速度
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Sprite2D.flip_h = false
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = true
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# 归一化速度向量并乘以速度值
	velocity = velocity.normalized() * speed

	# 如果速度向量的长度大于0，表示玩家在移动
	if velocity.length() > 0:
		anim_player.play("run")
	else:
		anim_player.play("idel")

	# 应用重力
	if not is_on_floor():
		velocity.y += gravity * delta

	# 处理跳跃
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 设置速度并调用 move_and_slide
	set_velocity(velocity)
	move_and_slide()

func set_target_position(position: Vector2):
	target_position = position
	
func _process(delta: float):
	if target_position:
		var direction = (target_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		# Check if the player has reached the target position
		if global_position.distance_to(target_position) < speed * delta:
			# Stop moving when close enough to target
			velocity = Vector2.ZERO
			target_position = Vector2.ZERO
