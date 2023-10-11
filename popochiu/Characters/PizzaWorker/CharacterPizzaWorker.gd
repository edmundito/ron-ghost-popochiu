tool
extends PopochiuCharacter

const Data := preload('CharacterPizzaWorkerState.gd')

var state: Data = preload('CharacterPizzaWorker.tres')

func _can_bake_pizza() -> bool:
	return state.has_pizza_box && state.has_sauce && state.has_cheese && state.has_pepperoni


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
		E.run(['Player: I already have a pizza box'])
	elif !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		E.run(["Player: I... don't know what to get."])
	else:
		E.run([
	    C.walk_to_clicked(),
	    "Player: One Pepperoni pizza",
			"PizzaWorker: Here you go!",
	    I.PizzaBox.add()
	  ])


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		'PizzaBox':
			yield(E.run([
				"PizzaWorker: Sorry, we don't take returns"
			]), 'completed')

			if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
				return

			if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA):
					yield(E.run([
						"Player: This pizza is only crust!",
						"PizzaWorker: Let me see that...",
						I.PizzaBox.remove(),
						"PizzaWorker: Oh no!",
						"PizzaWorker: Looks like we're out of materials again.",
						"Player: Materials?",
						"PizzaWorker: Yeah, the PizzaBot can't make them.",
						G.display("There's dialog options here... TLDR you can bring all the materials to the pizza worker and they'll bake you the pizza.")
					]), 'completed')

					Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA)
					self.state.has_pizza_box = true

		'Sauce':
			I.Sauce.remove_now()
			self.state.has_sauce = true

		'Cheese':
			I.Cheese.remove_now()
			self.state.has_cheese = true

		'Pepperoni':
			I.Pepperoni.remove_now()
			self.state.has_pepperoni = true

		_:
			.on_item_used(item)
			return

	if _can_bake_pizza():
		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.NEW_PIZZA)
		E.run([
			"PizzaWorker: Here is your rebaked pizza!",
			I.PizzaBox.add()
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
