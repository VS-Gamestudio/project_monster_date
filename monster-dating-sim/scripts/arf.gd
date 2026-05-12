extends Node2D


func _ready() -> void:
	TranslationServer.set_locale("en")
	Dialogic.start("example_timeline")
