extends Button

@onready var dialog = $ConfirmationDialog

func _ready() -> void:
	set_dialog_content()

func set_dialog_content():
	dialog.title = "Quit game"
	dialog.dialog_text = "Are you sure to leave the game?"
	dialog.ok_button_text = "Yes please"
	dialog.cancel_button_text = "Cancel"

func _on_pressed():
	dialog.popup_centered()

func _on_dialog_confirmed() -> void:
	get_tree().quit()
