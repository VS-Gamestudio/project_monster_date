extends Button

const MAIN_SCENE = preload("uid://dkj1xh1lhqswt")

func _on_pressed():
		get_tree().change_scene_to_packed(MAIN_SCENE)
