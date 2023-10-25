tool
extends PopochiuRoom

const Data := preload('RoomGrundysmartState.gd')

var state: Data = preload('RoomGrundysmart.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
	state.item_count = 0
	get_prop("Bucket").set_enabled(not state.took_bucket, false)
	C.Phil.set_enabled(Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.NEW_PIZZA), false)


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	if state.visited_first_time:
		E.run(["Kiosk: Welcome to Grundismart Bodega!"])
	else:
		E.run(["Kiosk: Welcome back!"])

	if (
		Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.NEW_PIZZA) &&
		!Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.DESTROY_KIOSK)
	):
		yield(E.run_cutscene([
#			E.play_transition(TransitionLayer.PASS_DOWN_OUT, 0.5),
			G.display("In this cutscene, Phil destroys the kiosk..."),
			E.camera_shake(),
			C.Kiosk.disable()
		]), 'completed')
		Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.COMPLETE)
		C.Phil.disable()
		return


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here

func count_pick_up_item(description: String, is_in_queue := true) -> void:
	if is_in_queue: yield()
	state.item_count += 1
	yield(C.Kiosk.say("%s was added to your cart." % description, not is_in_queue), "completed")

func get_picked_up_items_count() -> int:
	return state.item_count

func has_picked_up_items() -> bool:
	return state.item_count > 0

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
