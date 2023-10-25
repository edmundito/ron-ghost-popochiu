tool
extends PopochiuHotspot
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	var instructions: Array = [
		C.walk_to_clicked(),
		C.face_clicked(),
		"Kiosk: Thanks for coming by!",
	]

	if R.Grundysmart.has_picked_up_items():
		var count = R.Grundysmart.get_picked_up_items_count()
		instructions.append_array([
			"Kiosk: We will checkout %d item%s on your behalf." % [
				count,
				's' if count > 1 else ''
			],
		])
		pass

	yield(E.run(instructions), 'completed')
	E.goto_room('TownSquare')


# When the node is right clicked
func on_look() -> void:
	pass


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	# Replace the call to .on_item_used(item) to implement your code. This only
	# makes the default behavior to happen.
	# For example you can make the PC react on using some items in this Hotspot
#	if item.script_name == 'Key':
#		E.run(['Player: No can do'])
	.on_item_used(item)
