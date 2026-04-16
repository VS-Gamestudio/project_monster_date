extends Button

const TARGET_SCENE = ("res://scenes/ui/menus/main_menu.tscn") #packedScene didn't work here

func _on_pressed():
	get_tree().change_scene_to_file(TARGET_SCENE)
