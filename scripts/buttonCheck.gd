extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var popup = $MenuButton.get_popup()
	popup.add_item("Option 1", 1) # 添加菜单项，文本为 "Option 1"，ID 为 1
	popup.add_item("Option 2", 2) # 添加菜单项，文本为 "Option 2"，ID 为 2
	popup.add_item("Option 3", 3) # 添加菜单项，文本为 "Option 3"，ID 为 3
	
	popup.connect("id_pressed", Callable(self, "_on_menu_item_selected"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_check_button_button_down():
	if ($AnimatedSprite2D.animation == "idel"):
		$AnimatedSprite2D.play("idel2")
	else:
		$AnimatedSprite2D.play("idel")
	pass # Replace with function body.

func _on_menu_item_selected(id):
	match id:
		1:
			print("Dynamic Option 1 selected")
		2:
			print("Dynamic Option 2 selected")
		3:
			print("Dynamic Option 3 selected")

func _on_menu_button_button_down():
	$MenuButton.get_popup().show()
