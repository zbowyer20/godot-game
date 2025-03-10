extends Area2D

func _on_WarpArea_body_entered(body: Node) -> void:
	# if body.name == "Character":
		# or use `body.is_in_group("Player")` if you prefer groups
	print("Triggered!")
	var new_scene = preload("res://scenes/Main2.tscn")
	get_tree().change_scene_to(new_scene)

func _on_area_2d_body_entered(body:Node2D) -> void:
	print("Triggered!")
	get_tree().change_scene_to_file("res://scenes/Main2.tscn")


func _on_body_entered(body: Node2D) -> void:
	print("Triggered!")
	get_tree().change_scene_to_file("res://scenes/Main2.tscn")
