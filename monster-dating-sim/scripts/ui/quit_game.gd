extends Button

# Easy script to quit the current running game.

func _ready() -> void:
	$".".pressed.connect(quit_game)

func quit_game():
	get_tree().quit()
