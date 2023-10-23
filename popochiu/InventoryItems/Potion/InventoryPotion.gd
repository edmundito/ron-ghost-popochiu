extends PopochiuInventoryItem

const Data := preload('InventoryPotionState.gd')

var state: Data = preload('InventoryPotion.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods as needed


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the item is clicked in the inventory
func on_interact() -> void:
	if C.player.room.name == R.StoreBackroom.name:
		var hLocker := E.current_room.get_hotspot("Locker")
		var ptCenter := E.current_room.get_point("Center")

		yield(E.run([
			"Player: OK, time to drink the potion...",
			C.player.walk_to(Vector2(C.player.position.x, ptCenter.y)),
			self.remove(),
			"Player: GLUG GLUG GLUG",
			"Player: ...",
			"Player: ...",
			G.display("Jira's skin turns green, her eyes yellow, and suddenly the locker opens"),
			"Hooky: Let's go!",
			C.Hooky.walk_to(hLocker.walk_to_point),
			C.Hooky.disable(),
			"Jira: OK, my turn...",
			"Elandra: Wait here.",
			"Jira: What?!",
			"Elandra: You've done enough, and I can take it from here.",
			"Elandra: I will go find my son.",
			"Elandra: Go home to your parents.",
			"Jira: But...",
			"Jira: ...",
			"Jira: OK, fine.",
			C.Elandra.walk_to(hLocker.walk_to_point),
		]), "completed")
		C.set_player(C.Elandra)
		E.goto_room("LockerBackroom")
		return

	E.run([
		G.display("I'll drink the potion when I find the locker.")
	])


# When the item is right clicked in the inventory
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()


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
