extends PopochiuInventoryItem

const Data := preload('InventoryPotionState.gd')

var state: Data = preload('InventoryPotion.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods as needed


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the item is clicked in the inventory
func on_interact() -> void:
	if C.player.room.name != R.StoreBackroom.name:
		E.run([
			"I'll drink this potion when I am close the locker."
		])
		return

	var locker := E.current_room.get_hotspot("Locker")
	var centerPoint := E.current_room.get_point("Center")

	var q = [
		"It was time to drink the potion....",
		C.Jira.walk_to(Vector2(C.player.position.x, centerPoint.y)),
		"Jira: I cry to the souls of the beyond...",
		"Jira: ...to illuminate my mind when I drink this brew...",
		"Jira: ...so I can open the gate of Davy Jones's locker...",
		"Jira: ...to fall away from the world that I've known...",
		"Jira: ...and see into forever.",
		"ANIM - Jira drinks from the cup.",
		self.remove(false),
		"...",
		"Jira: ...",
		"ANIM - Jira's skin turns green and her eyes yellow.",
		"Hooky: Avast!",
		"Jira: *clackles*",
		"ANIM - The locker opens, inside it looks like a portal.",
		"Jira: ...",
		"Jira: Uhh...",
		"ANIM - Jira changes back to her normal colors.",
		"...",
		"Hooky: Well, let's get going!",
		C.Hooky.walk_to(locker.walk_to_point),
		C.Hooky.disable(),
		"Jira: OK, my turn to go...",
		"Elandra: Wait here.",
		"Jira: What?!",
		"Elandra: You've done enough, and I can take it from here.",
		"Jira: ...",
		C.Elandra.walk_to(locker.walk_to_point),
		"Elandra: I will go find my son.",
		"Jira: But...",
		"Elandra: Jira...",
		"Elandra: Go home to your parents.",
		"Jira: ...",
		C.Jira.walk_to_room_point("ElandraWalkTo"),
		"Jira: OK, fine.",
		C.Elandra.disable(),
		"AIM/Tween - The Locker disappears",
		"Jira: Oh no!"
	]

	yield(E.run(q), "completed")
	C.player = C.Elandra
	E.goto_room("LockerBackroom")


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
