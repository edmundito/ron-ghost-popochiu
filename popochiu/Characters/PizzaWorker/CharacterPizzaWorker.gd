tool
extends PopochiuCharacter

const Data := preload('CharacterPizzaWorkerState.gd')

var state: Data = preload('CharacterPizzaWorker.tres')

func _can_bake_pizza() -> bool:
	return state.has_pizza_box && state.has_sauce && state.has_cheese && state.has_pepperoni

func _bad_pizza() -> Array:
	Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA)
	self.state.has_pizza_box = true

	return [
		"Player: This pizza is only crust!",
		"PizzaWorker: Let me see that...",
		I.PizzaBox.remove(),
		"PizzaWorker: Oh no!",
		"PizzaWorker: Looks like we're out of materials again.",
		"Player: Materials?",
		"PizzaWorker: Yeah, the PizzaBot can't make them.",
		G.display("There's dialog options here... TLDR you can bring all the materials to the pizza worker and they'll bake you the pizza.")
	]


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	var q: Array = [
		C.walk_to_clicked(),
		C.face_clicked(),
		"Jira: Hi, Beena.",
		"PizzaWorker: Hi, Jira!"
	]

	if state.first_chat:
		q.append_array([
			"PizzaWorker: How's it going?",
			"Jira: Oh, nothing much going on...",
			"I had a class with Beena, and I didn't know her wery well, so I decided not to tell her too much."
		])

	q.append_array([
		"PizzaWorker: What would you like today?"
	])

	if (
		I.is_item_in_inventory("PizzaBox") and
		Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX) and
		!Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA)
		):
		q.append_array(_bad_pizza())
	elif state.has_pizza_box and !Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA):
		q.append_array([
			"Player: I'm still getting those ingredients for you.",
			"PizzaWorker: Dope.",
			"PizzaWorker: You can give them to me as you get them.",
			"PizzaWorker: Once I have all the ingredients, I can glow up this pizza crust.",
		])
	elif I.is_item_in_inventory("PizzaBox"):
		q.append_array([
			"Player: Er... I just wanted to say thanks for the pizza!",
			"PizzaWorker: You're welcome!"
		])
	elif !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		q.append_array([
			"Jira: Uh... what?",
			"PizzaWorker: I'm guessing you're here for pickup or to place an order.",
			"Jira: Oh.",
			"Jira: No, not really.",
			"PizzaWorker: OK.",
		] if state.first_chat else [
			"Jira: I still haven't decided."
		])
		q.append(
			"PizzaWorker: Well, let me know when you've made up your mind."
		)
	else:
		q.append_array([
	    "Player: I'd like one Pepperoni pizza.",
			"TODO Some sequence of events where the pizza is made immediately",
			"PizzaWorker: Done!",
			"PizzaWorker: Here it is!",
			"TODO Some wow from Jira",
	    I.PizzaBox.add()
	  ])

	state.first_chat = false
	if q.size() > 0:
		E.run(q)


# When the node is right clicked
func on_look() -> void:
	E.run([
		"It was my classmate, Beena Pesaru.",
		"I didn't know her very well, and I didn't know she worked at the pizza place... until now."
	])


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
				yield(E.run(_bad_pizza()), "completed")

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
