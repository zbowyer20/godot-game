extends Area2D

@export var interaction_text: String = "Hello, world!"

var player_in_range = false

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
	if player_in_range and Input.is_action_just_pressed("interact"):
		print("Hi")
		# If dialog is NOT active, show it
		if not DialogBox.is_active():
			DialogBox.show_text(interaction_text)
			# disable movement
			# var player = get_tree().get_nodes_in_group("PlayerGroup")[0] # or another reference
			# player.movement_enabled = false
		else:
			# If dialog is already active, hide it
			DialogBox.hide_text()
			# var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
			# player.movement_enabled = true
