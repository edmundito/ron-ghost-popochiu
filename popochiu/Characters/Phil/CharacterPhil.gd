tool
extends PopochiuCharacter

const Data := preload('CharacterPhilState.gd')

var state: Data = preload('CharacterPhil.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	# Replace the call to .on_interact() to implement your code. This only makes
	# the default behavior to happen.
	if C.Phil.room.name == R.Alley.name:
		E.run([
			"Phil: I'm so hungry, I could eat a whole pizza!"
		])
		if !Globals.talked_to_phil():
			Globals.set_get_pizza_box();


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	if item.name == I.PizzaBox.name:
		yield(E.run_cutscene([
			C.walk_to_clicked(),
			C.face_clicked(),
			"Player: Here is your pizza!",
			"Phil: Great!",
			I.PizzaBox.remove(),
			"Phil: What's this?",
			"Player: What do you mean?",
			"Phil: This is just a pizza crust!",
			"Phil: Where is the sauce? The cheese, and the pepperoni?",
			"Player: Yikes! Let me see what I can do...",
			I.PizzaBox.add()
		]), 'completed')
#		yield(E.run([
#			C.walk_to_clicked(),
#			C.face_clicked(),
#			"Player: Here is your pizza!",
#			"Phil: Great!",
#		]), 'completed')
#
#		I.PizzaBox.remove()
#
#		yield(E.run([
#			"Phil: What's this?",
#			"Player: What do you mean?",
#			"Phil: This is just a pizza crust!",
#			"Phil: Where is the sauce? The cheese, and the pepperoni?",
#			"Player: Yikes! Let me see what I can do..."
#		]), 'completed')

		I.PizzaBox.add()
		Globals.set_build_pizza()
	else:
		E.run([
			"Player: Would you like this jawn?",
			"Phil: I'm not interested in that jawn.",
		])


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
