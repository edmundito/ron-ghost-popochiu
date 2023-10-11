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
	if C.Phil.room.script_name == R.Alley.script_name:
		if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
			yield(E.run([
				G.display("TODO: DIALOG HERE to learn more about phil..."),
				"Phil: I'm so hungry, I could eat a whole pizza!"
			]), 'completed')
			Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX)
		elif !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
			yield(E.run([
				"Phil: Where's my pizza?"
			]), 'completed')
	else:
		E.run([G.display("TODO: Phil Dialog")])


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == I.PizzaBox.script_name:
		if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA):
			yield(E.run([
				G.display("WIP cut-scene: Phil takes the pizza and eats it and then heads over to the Grundismart"),
#				E.play_transition(TransitionLayer.PASS_DOWN_IN, 0.5)
			]), 'completed')
			Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.DESTROY_KIOSK)
			E.goto_room('Grundysmart')
			return

		if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA):
			E.run([
				"Phil: Get me a completed pizza"
			])
			return

		yield(E.run_cutscene([
			C.walk_to_clicked(),
			C.face_clicked(),
			I.PizzaBox.remove(),
			"Player: Here is your pizza!",
			"Phil: Great!",
			"Phil: What's this?",
			"Player: What do you mean?",
			"Phil: This is just a pizza crust!",
			"Phil: Where is the sauce? The cheese...? And the pepperoni...?",
			"Player: Yikes! Let me see what I can do...",
			I.PizzaBox.add()
		]), 'completed')

		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA)
		return

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
