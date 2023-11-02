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
	yield(E.run([
		C.walk_to_clicked(),
		C.face_clicked()
	]), "completed")
	D.show_dialog("Phil")


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		G.display("He looks just like the A.I. at the Grundysmart.", false)


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name != I.PizzaBox.script_name:
		# TODO: Maybe map some default reponses per item somehow?
		E.run([
			"Player: Would you like this %s?" % item.description.to_lower(),
			"Phil: No thanks.",
		])
		return

	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA):
		state.ate_pizza = true

		yield(E.run([
			"Jira: I got you a real pepperoni pizza this time!",
			item.remove(),
			"Phil: Thanks!"
		]), 'completed')
		return

	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
		E.run([
			"Phil: Get me a real pizza!"
		])
		return

	yield(E.run_cutscene([
		C.walk_to_clicked(),
		C.face_clicked(),
		I.PizzaBox.remove(),
		"Jira: I got you a pizza.",
		"Phil: Great!",
		"...",
		"Phil: Wait... What's this?",
		"Jira: What do you mean?",
		"Phil: This is just a pizza crust!",
		"Phil: Where is the sauce?",
		"Phil: The cheese?",
		"Phil: And the pepperoni?",
		"Jira: Yikes!",
		"Jira: Let me see what I can do...",
		I.PizzaBox.add()
	]), 'completed')

	Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA)


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
