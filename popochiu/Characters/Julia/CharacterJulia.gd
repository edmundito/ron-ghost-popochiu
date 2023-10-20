tool
extends PopochiuCharacter

const Data := preload('CharacterJuliaState.gd')

var state: Data = preload('CharacterJulia.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	yield(E.run([
		"Julia: Oh, hi!",
		"Julia: I'm looking for the town square. Do you know where it is?",
		"Player: This is it.",
		"Julia: Oh.",
		G.display("Some more dialog here..."),
		"Julia: I'm an expert on minerals!"
	]), "completed")
	self.description = "Julia"
	state.talked_about_minerals = true


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()

func _on_give_instructions() -> void:
	if state.gave_fluroite:
			E.run([
				"Julia: (Temp) I already gave you the flourite!"
			])
			return

	if state.talked_about_minerals:
		state.gave_fluroite = true
		I.set_active_item(null)
		yield(E.run_cutscene([
			"Julia: (Temp) Oh, I see that you are looking for fluorite! I happen to have a little piece here. I'm happy to give it away!",
			I.Fluorite.add(),
		]), "completed")
		return

	E.run([
		"Julia: I'm not sure what this is."
	])

# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Instructions":
			self._on_give_instructions()
		"Bucket":
			E.run([
				"Player: Check out my bucket.",
				"Julia: Oooh, I love buckets!"
			])
		_:
			.on_item_used(item)


# Use it to play the idle animation for the character
func play_idle() -> void:
	.play_idle()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func play_walk(target_pos: Vector2) -> void:
	.play_walk(target_pos)


# Use it to play the talk animation for the character
func play_talk() -> void:
	.play_talk()


# Use it to play the grab animation for the character
func play_grab() -> void:
	.play_grab()
