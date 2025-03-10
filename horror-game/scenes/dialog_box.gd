extends CanvasLayer

@onready var panel := $Panel
@onready var text_label := $Panel/RichTextLabel
@onready var name_label := $Panel/RichTextLabel2
@onready var portrait := $Panel/TextureRect  # The newly added TextureRect
@onready var sfx_player := $SFXPlayer       # Reference to the AudioStreamPlayer

var dialog_active: bool = false

func show_text(name_text: String, dialog_text: String, portrait_path: String) -> void:
	var portrait_texture = load(portrait_path)
	portrait.texture = portrait_texture
	text_label.text = dialog_text
	name_label.text = name_text
	panel.visible = true
	dialog_active = true
	sfx_player.play()

func hide_text() -> void:
	panel.visible = false
	dialog_active = false

func is_active() -> bool:
	return dialog_active
