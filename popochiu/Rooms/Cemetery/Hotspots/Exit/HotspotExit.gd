tool
extends PopochiuHotspot
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	if C.Sorendo.visible:
		E.run([
			C.face_clicked(),
			"I wanted to leave, but Sorendo was waiting for me at the other side of the cemetery."
		])
		return

	yield(E.run([
		C.walk_to_clicked(),
		C.face_clicked(),
	]), "completed")

	var room_name = "Eri0os" if R.Cemetery.should_play_intro_cutscene() else "CemeteryEntrance"
	E.goto_room(room_name)


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	# For example you can make the character walk to the Hotspot and then say
	# something:
#	E.run([
#		C.face_clicked(),
#		'Player: A closed door'
#	])
	.on_look()


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	# Replace the call to .on_item_used(item) to implement your code. This only
	# makes the default behavior to happen.
	# For example you can make the PC react on using some items in this Hotspot
#	if item.script_name == 'Key':
#		E.run(['Player: No can do'])
	.on_item_used(item)
