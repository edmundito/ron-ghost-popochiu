tool
extends PopochiuRoom

const Data := preload('RoomStoreBackroomState.gd')

var state: Data = preload('RoomStoreBackroom.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
#	I.add_item("Potion", false, false) # Temp

	if self.state.visited_first_time:
		C.Hooky.disable(false)
		C.Elandra.disable(false)


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	if self.state.visited_first_time:
		var q: Array = [
			"That must be the locker.",
			C.player.walk_to_hotspot("Locker"),
			C.player.face_up(),
			"TODO Anim - Jira opens the locker.",
			"Jira: And... it's empty.",
			"TODO Anim - Jira closes the locker.",
			C.Hooky.enable(),
			"Hooky: Indeed it is.",
			C.Hooky.walk_to(self.get_hotspot("Locker").walk_to_point + Vector2(50.0, 0)),
			"Hooky: Now, let's get that potion ready.",
			C.Elandra.enable(),
			"Elandra: Did I hear potion?",
			C.Elandra.walk_to_room_point("ElandraWalkTo"),
			"Jira: Were you two following me?"
		]
		yield(E.run_cutscene(q), "completed")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
