extends CanvasLayer

@onready var panel := $Panel
@onready var text_label := $Panel/RichTextLabel

var dialog_active: bool = false

func show_text(dialog_text: String) -> void:
	text_label.text = dialog_text
	panel.visible = true
	dialog_active = true

func hide_text() -> void:
	panel.visible = false
	dialog_active = false

func is_active() -> bool:
	return dialog_active
