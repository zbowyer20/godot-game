extends Node2D

@onready var image_ui := $HorrorScene/TextureRect
@onready var sfx_player := $Shock 

var event_triggered = false

func _on_return_body_entered(body:Node2D) -> void:
	print(event_triggered)
	if (event_triggered):
		$Martin.start_moving()
	


func _on_horror_body_entered(body:Node2D) -> void:
	image_ui.visible = true
	sfx_player.play()
