tool
extends PopochiuRoom

const Data := preload('RoomSignState.gd')

var state: Data = preload('RoomSign.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ GODOT ░░░░
# TODO: Overwrite Godot's methods


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func on_room_entered() -> void:
	A.mx_rotn.loop = false
	A.mx_rotn.play_now()

func _stop_music_on_skip_cutscene() -> void:
	yield()
	if E.cutscene_skipped:
		A.mx_rotn.stop_now(0.5)
	yield(E.get_tree(), 'idle_frame')


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	# You can use yield(E.run([]), 'completed') to excecute a queue of instructions
	var q: Array = []
	for i in 8:
		q.append_array(['..', '..'])

	q.append(_stop_music_on_skip_cutscene())
	yield(E.run_cutscene(q), 'completed')
	E.goto_room('Cemetery')


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here
