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
	# TODO Have elandra walk into room when using the potion
	if I.is_item_in_inventory("Potion"):
		C.Elandra.enable(false)
		C.Elandra.position = self.get_point('ElandraWalkTo')


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	if self.state.visited_first_time:
		yield(E.run_cutscene([
			G.display("That must be the locker."),
			C.player.walk_to_hotspot("Locker"),
			C.player.face_up(),
			G.display("TODO Anim - Open the locker."),
			"Jira: And... it's empty.",
			C.Hooky.enable(),
			"Hooky: Indeed it is.",
			C.Hooky.walk_to(self.get_hotspot("Locker").walk_to_point + Vector2(50.0, 0)),
			G.display("TODO - more cutscene... make and drink the potion.")
		]), "completed")


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
