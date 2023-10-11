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
	pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
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


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
