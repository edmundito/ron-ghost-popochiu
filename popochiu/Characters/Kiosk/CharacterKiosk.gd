tool
extends PopochiuCharacter

const Data := preload('CharacterKioskState.gd')

var state: Data = preload('CharacterKiosk.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	# Replace the call to .on_interact() to implement your code. This only makes
	# the default behavior to happen.
	yield(E.run([C.walk_to_clicked(), C.face_clicked()]), "completed")
	D.show_dialog('Kiosk')


# When the node is right clicked
func on_look() -> void:
	if R.Alley.state.visited_times > 0:
		yield(E.run(["The A.I. looked a lot like the man in the alley, but younger."]), "completed")
	else:
		yield(E.run(["It was just an A.I. that was made to look like a real human."]), "completed")

	if not Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_KIOSK):
		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL)



# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	# Replace the call to .on_item_used(item) to implement your code. This only
	# makes the default behavior to happen.
	.on_item_used(item)


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
