extends PopochiuInventoryItem

const Data := preload('InventoryPizzaBoxState.gd')

var state: Data = preload('InventoryPizzaBox.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods as needed


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the item is clicked in the inventory
func on_interact() -> void:
	# Replace the call to .on_interact() to implement your code. This only makes
	# the default behavior to happen.
	.on_interact()


# When the item is right clicked in the inventory
func on_look() -> void:
	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.BUILD_PIZZA):
		E.run([
			"It's a good enough pizza with Lucca's chunky marinara, Mozarella from RON, and \"What is Pepperoni?\" pepperoni-like substitute.",
		])
		return

	if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX):
		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA)
		E.run([
			"I looked at at the pizza and...",
			"What the...?!",
			"It was just a baked crust!",
			"There was no sauce, no cheese, and no toppings."
		])
		return

	E.run([
		"This was the worst pizza I've ever seen.",
		"It was just a baked crust without sauce, cheese, or toppings."
	])



# When the item is clicked and there is another inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	# Replace the call to .on_item_used(item) to implement your code. This only
	# makes the default behavior to happen.
	.on_item_used(item)


# Actions to excecute after the item is added to the Inventory
func on_added_to_inventory() -> void:
	# Replace the call to .on_added_to_inventory() to implement your code. This only
	# makes the default behavior to happen.
	.on_added_to_inventory()


# Actions to excecute when the item is discarded from the Inventory
func on_discard() -> void:
	# Replace the call to .on_discard() to implement your code. This only
	# makes the default behavior to happen.
	.on_discard()
