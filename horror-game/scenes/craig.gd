extends Area2D

@export var interaction_text: String = "Some has stolen my plane tickets! Can you find them for me?"
@export var portrait_path: String = "empty"
@export var name_label: String = "empty'"

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
			DialogBox.show_text(name_label, interaction_text, portrait_path)
			var main2 = get_parent()
			main2.event_triggered = true
			# disable movement
			# var player = get_tree().get_nodes_in_group("PlayerGroup")[0] # or another reference
			# player.movement_enabled = false
		else:
			# If dialog is already active, hide it
			DialogBox.hide_text()
			var objectives_ui = get_tree().get_nodes_in_group("ObjectivesUIGroup")[0]
			objectives_ui.add_objective("- Ｔｈє ＡＩ ｉｓ ｈｕｎｇяу…")
			objectives_ui.add_objective("ＦＥＥＤ 𝐓𝐇𝐄 𝕬𝕴…")
			# var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
			# player.movement_enabled = true
