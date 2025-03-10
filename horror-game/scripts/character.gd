extends CharacterBody2D

@export var speed: float = 150.0

func _physics_process(delta):
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_vector.y = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
    
    if input_vector.length() > 0:
        input_vector = input_vector.normalized()
    
    velocity = input_vector * speed
    move_and_slide()

func _on_area_2d_area_shape_entered(area_rid:RID, area:Area2D, area_shape_index:int, local_shape_index:int) -> void:
    print("Triggered!")
    var new_scene = preload("res://scenes/Main2.tscn")
    get_tree().change_scene_to(new_scene)
