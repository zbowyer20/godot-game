extends Node2D

func _on_WarpArea_body_entered(body: Node) -> void:
    # if body.name == "Character":
        # or use `body.is_in_group("Player")` if you prefer groups
    var new_scene = preload("res://scenes/Main2.tscn")
    get_tree().change_scene_to(new_scene)