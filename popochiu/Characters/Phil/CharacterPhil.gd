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
	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		G.display("It's Phil.", false)
	elif Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_KIOSK):
		G.display("He looks just like the A.I. at the Grundysmart.", false)
	else:
		G.display("I'm not sure who this is.")



# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	var q: Array = [
		C.walk_to_clicked(),
		C.face_clicked()
	]
	if item.script_name != I.PizzaBox.script_name:
		# TODO: Maybe map some default reponses per item somehow?
		q.append_array([
			"Player: Would you like this %s?" % item.description.to_lower(),
			"Phil: No thanks.",
		])
	elif Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA):
		state.ate_pizza = true

		q.append_array([
			"Jira: I got you a real pepperoni pizza this time!",
			item.remove(),
			"Phil: Thanks!"
		])
	elif Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
		q.append_array([
			"Phil: Get me a real pizza!"
		])
	else:
		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA)
		q.append_array([
			"Jira: I got you a pizza.",
			I.PizzaBox.remove(),
			"Phil: Great!",
			"...",
			"Phil: Hang on...",
			"Phil: What's this?!",
			"Jira: What?",
			"Phil: This is just a pizza crust!",
			"Phil: Where is the sauce?",
			"Phil: The cheese?",
			"Phil: And the pepperoni?!",
			"Jira: Yikes!",
			"Jira: Let me see what I can do...",
			I.PizzaBox.add()
		])

	E.run(q)


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
