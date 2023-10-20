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
	print("BUCKET", bucket.script_name, state.bucket_visible)
	if state.bucket_visible:
		bucket.enable(false)
	else:
		bucket.disable(false)

	get_prop("Table").clickable = not state.bucket_visible


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	# You can use yield(E.run([]), 'completed') to excecute a queue of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
