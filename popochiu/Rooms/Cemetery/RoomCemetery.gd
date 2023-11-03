tool
extends PopochiuRoom

const Data := preload('RoomCemeteryState.gd')

var state: Data = preload('RoomCemetery.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
	C.Davy.disable(false)

	if _should_play_intro_cutscene():
		get_prop("Flower").disable(false)
		C.Jira.disable(false)
	else:
		C.Sorendo.disable(false)


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	if not _should_play_intro_cutscene():
		return

	yield(E.run([
		E.wait(3.0),
		C.Jira.enable(),
		C.Jira.walk_to_hotspot("DavyGrave"),
		"Jira: Sorry I'm late.",
		"Sorendo: No worries.",
		"Sorendo: I found out this guy dated my mom, once...",
		G.display("They talk about a spell, cast it, and..."),
		C.Davy.enable(),
		"Davy: Hello",
		"Sorendo: Is that you, Davy Jones?",
		"Davy: Blah blah blah...",
		"Davy: How dare you disturb my grave?",
		"Sorendo: Well...",
		"Davy: Time to lock you up!",
		"Sorendo: AHHHHHH!!!",
		C.Davy.disable(),
		C.Sorendo.disable(),
		E.wait(1.0),
		"Jira: Oh no.",
		"Jira: Sorendo?",
		"Jira: I better get some help...",
	]), "completed")

	E.goto_room("Eri0os")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here

func _should_play_intro_cutscene() -> bool:
	return C.player.last_room == "Sign" and state.visited_first_time
