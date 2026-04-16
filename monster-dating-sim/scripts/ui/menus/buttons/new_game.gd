extends Button

const TARGET_SCENE = preload("uid://c30y8ec6dfbh7")

func _on_pressed():
		get_tree().change_scene_to_packed(TARGET_SCENE)
