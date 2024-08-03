extends Area2D

# 定义一个常量
const NEW_SCENE_PATH: String = "res://sences/basicSence.tscn"

func _ready():
	# 预加载场景
	pass

func load_scene():
	# 使用 call_deferred() 将场景切换推迟到主线程的空闲时间
	call_deferred("_deferred_load_scene")

func _deferred_load_scene():
	var scene_tree = get_tree()
	scene_tree.change_scene_to_file(NEW_SCENE_PATH)

func _on_body_entered(body):
	load_scene()
	pass # Replace with function body.
