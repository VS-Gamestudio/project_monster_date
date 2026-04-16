extends Button

@export var safed_scene: PackedScene

func _on_pressed():
	if safed_scene:
		var loaded_scene = safed_scene.instantiate()
		add_child(loaded_scene)
	else:
		push_error("Botton has not declared any scene!")
