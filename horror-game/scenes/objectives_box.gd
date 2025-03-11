extends CanvasLayer

@onready var objectives_label := $Panel/RichTextLabel2

var objectives: Array[String] = []

func add_objective(new_objective: String) -> void:
	objectives.append(new_objective)
	_update_objectives_text()

func _update_objectives_text() -> void:
	# Combine all objectives into one string with line breaks
	var text = ""
	for obj in objectives:
		text += obj + "\n"

	objectives_label.bbcode_text = text  # If using RichTextLabel, you can use BBCode, etc.
