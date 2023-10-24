tool
extends PopochiuRoom

const Data := preload('RoomAlleyState.gd')

var state: Data = preload('RoomAlley.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.DESTROY_KIOSK):
		C.Phil.disable(false)
	else:
		C.Phil.enable(false)


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	yield(E.run([
			C.player.walk_to_room_point("AlleyEntry"),
	]), "completed")

	# You can use yield(E.run([]), 'completed') to excecute a queue of instructions
	if not Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_KIOSK):
		yield(E.run([
			"Phil: Got a spare dollar?",
			"Jira: I... er... no...",
			C.player.walk_to_hotspot("TownSquareExit"),
			G.display("I got scared."),
			G.display("I wasn't raised to know how to chat with the homeless and did not understand that he was struggling right away."),
			G.display("I would later know who he was, and that we could help each other."),
		]), "completed")
		E.goto_room("TownSquare")
		return

	if not Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		E.run([
			"Phil: Got a spare dollar?"
		])

# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
