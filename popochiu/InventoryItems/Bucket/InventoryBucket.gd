extends PopochiuInventoryItem

const Data := preload('InventoryBucketState.gd')

var state: Data = preload('InventoryBucket.tres')


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
	E.run([
		"This was my cauldron for the potion.",
	])


# When the item is clicked and there is another inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	var q: Array = []
	if Globals.POTION_INGREDIENTS.has(item.script_name):
		q.append("I thought about adding the ingredients, but I need to fill this bucket with warm water first.")
	else:
		q.append("%s is not part of the ingredients for the potion." % item.description)

	yield(E.run(q), "completed")


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
