extends Node2D

# @onready var anim_player := $AnimationPlayer
@onready var sprite := $Sprite2D  # or $TextureRect
@onready var sfx_player := $AudioStreamPlayer

func _ready():
    # Optionally, we can set the sprite fully opaque here:
    # sprite.modulate = Color(1,1,1,1)
    # Ensure the "fade_out" animation is not playing yet.
    # We'll trigger it on Space press.
    pass

func _process(delta):
    # If user presses Space and the fade animation is not yet playing
    if Input.is_action_just_pressed("interact"):
        # anim_player.play("fade_out")
        sfx_player.play()
        await sfx_player.finished
        get_tree().change_scene_to_file("res://scenes/Main.tscn")

# func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
#     if anim_name == "fade_out":
#         # Once fade is done, load main screen
#         get_tree().change_scene_to_file("res://scenes/Main.tscn")