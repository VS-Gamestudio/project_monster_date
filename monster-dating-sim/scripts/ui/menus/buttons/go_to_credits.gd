extends Button

const TARGET_SCENE = preload("uid://d05aukrpejxee")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(TARGET_SCENE)
