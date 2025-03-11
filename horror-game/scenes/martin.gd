extends Area2D

@export var interaction_text: String = "Some has stolen my plane tickets! Can you find them for me?"
@export var portrait_path: String = "empty"
@export var name_label: String = "empty'"

@onready var sfx_player := $AudioStreamPlayer 

var player_in_range = false
var martin_is_worried = false
var martin_is_really_worried = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	print(body.name)
	if body.name == "Character":  # or body is Player
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Character":
		player_in_range = false

func _process(delta: float) -> void:
	# Check if player is in range and the user pressed Space
	if Input.is_action_just_pressed("interact"):
		if martin_is_really_worried:
			DialogBox.hide_text()
		elif martin_is_worried:
			DialogBox.hide_text()
			sfx_player.play()
			await sfx_player.finished
			print("Finished")
			martin_is_really_worried = true
			DialogBox.show_text(name_label, "What was that?!", portrait_path)
		elif player_in_range:
			print("Hi")
			# If dialog is NOT active, show it
			if not DialogBox.is_active():
				DialogBox.show_text(name_label, interaction_text, portrait_path)
				# disable movement
				# var player = get_tree().get_nodes_in_group("PlayerGroup")[0] # or another reference
				# player.movement_enabled = false
			else:
				# If dialog is already active, hide it
				DialogBox.hide_text()
				var objectives_ui = get_tree().get_nodes_in_group("ObjectivesUIGroup")[0]
				objectives_ui.add_objective("- Do the washing up")
				objectives_ui.add_objective("- Find the plane tickets")
				# var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
				# player.movement_enabled = true

func start_moving() -> void:
	# Maybe you use a Tween, or set a velocity if it's a KinematicBody2D, etc.
	print("Other character is now moving!")
	var tween = create_tween()
	# Example: if you're using a Tween to move to a new position
	var new_x = 800
	var new_pos = Vector2(new_x, position.y)
	
	tween.tween_property(self, "position", new_pos, 2.0)

	await tween.finished
	martin_is_worried = true
	DialogBox.show_text(name_label, "I don't think that guy works here...", portrait_path)
