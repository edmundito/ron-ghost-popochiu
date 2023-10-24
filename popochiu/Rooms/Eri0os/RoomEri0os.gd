tool
extends PopochiuRoom

const Data := preload('RoomEri0osState.gd')

var state: Data = preload('RoomEri0os.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
	var bucket = get_prop("Bucket")
#	print("BUCKET", bucket.script_name, state.bucket_visible)
	if state.bucket_visible:
		bucket.enable(false)
	else:
		bucket.disable(false)

#	if state.bucket_visible:
#		get_prop("Table").disable_interaction()


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	# You can use yield(E.run([]), 'completed') to excecute a queue of instructions
	if state.visited_first_time:
		E.run([
			G.display("TODO Cut-scene: Jira meets with the chief of police, Elandra (Sorendo's mom) and they're talking abou the situation"),
			G.display("An older Hooky McPegleg appears out of nowhere and explains that Sorendo was taken to Davy Jones' Locker"),
			G.display("Hooky found that the locker is in the back room of the general store, and there is a spell that is given to Jira"),
			I.Instructions.add()
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
