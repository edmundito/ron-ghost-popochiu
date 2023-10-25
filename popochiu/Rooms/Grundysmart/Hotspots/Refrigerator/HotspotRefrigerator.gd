tool
extends PopochiuHotspot
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	yield(E.run([
		C.walk_to_clicked(),
		C.face_clicked(),
	]), "completed")

	if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA):
		E.run([
			"There were a lot of interesting things in there, but I wasn't sure what I needed... yet."
		])
		return

	if R.Grundysmart.state.got_cheese:
		E.run(["There was nothing else in the refrigrator that interested me."])
		return

	R.Grundysmart.state.got_cheese = true
	E.run([
		C.walk_to_clicked(),
		C.face_clicked(),
		"I took the cheese and pepperoni.",
		I.Cheese.add(false),
		R.Grundysmart.count_pick_up_item(I.Cheese.description),
		I.Pepperoni.add(false),
		R.Grundysmart.count_pick_up_item(I.Pepperoni.description)
	])



# When the node is right clicked
func on_look() -> void:
	var instructions: Array = [
		"The refrigerator was filled with all kinds of goodies."
	]

	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.EMPTY_PIZZA):
		if R.Grundysmart.state.got_cheese:
			instructions.append("There was nothing else in the refrigrator that interested me.")
		else:
			instructions.append("I saw cheese and pepperoni that could help with my pizza.")

	E.run(instructions)


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	# Replace the call to .on_item_used(item) to implement your code. This only
	# makes the default behavior to happen.
	# For example you can make the PC react on using some items in this Hotspot
#	if item.script_name == 'Key':
#		E.run(['Player: No can do'])
	.on_item_used(item)
