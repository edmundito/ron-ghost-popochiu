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
	var bucket := get_prop("Bucket")
	if state.bucket_visible:
		bucket.enable(false)
	else:
		bucket.disable(false)

	if state.visited_first_time:
		C.Hooky.disable(false)


# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	if state.visited_first_time:
		_run_intro_cutscene()

# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here

func _run_intro_cutscene():
	E.run_cutscene([
		"Jira: ...and then the Davy and Sorendo disappeared!",
		"Sheriff: Well, I don't know what to say.",
		"Elandra: Davy Jones has returned, somewhat.",
		"Elandra: I can't believe it.",
		"Sheriff: Believe it or not, we have to get rid of this evil.",
		"Sheriff: Mayor Lima and I want to move on with the autumn festival.",
		"Elandra: But, Sheriff, that's tomorrow!",
		"Elandra: You must cancel the festival to keep kids safe.",
		"Sheriff: Can't.",
		"Sheriff: This is the town's biggest tourist event.",
		"Sheriff: Visitors are already here, and it helps fund our department with plenty of parking tickets and traffic citations.",
		"Sheriff: The festival moves on.",
		"Elandra: We need more time to find help.",
		"Sheriff: Don't you worry, we will be posting a reward for a thousand to whoever who catches it.",
		"Elandra: We need experts!",
		"Sheriff: Bah, any of the weirdos in this town can catch a gho--",
		"*CHALKBOARD FINGERNAIL SCRATCH*",
		C.Hooky.enable(),
		"Hooky: I couldn't help but overhear your conversation.",
		"Sheriff: Where did you come from?",
		"Elandra: You look vaguely familiar....",
		"Hooky: I'm Hooky McPegleg - Renowed pirate and former Reality-on-the-Norm postman.",
		"Elandra: I remember you!",
		"Elandra: You're back after all these years?",
		"Hooky: Aye, my search for Davy Jones's Locker has led me here.",
		"Hooky: It is the stuff of pirate legend.",
		"Sheriff: What do you know, Mr. McPegleg?",
		"Hooky: I can tell you what I know about Davy Jones's Locker for the bounty you offer...",
		"Hooky: ...but I need twice as much booty to catch and get rid of him.",
		"Hooky: So sheriff, are ye gonna keep people alive and increase the loot, or are ye going to play it cheap?",
		"...",
		"Sheriff: Sigh.",
		"Sheriff: I'll talk to Mayor Lima to see what we can do.",
		"Hooky: Yo ho ho!",
		"Hooky: I'll be right here to answer any questions.",
		"Elandra: And I can't sit here waiting.",
		C.Elandra.walk_to_hotspot("TownSquareExit"),
		"Elandra: I'm going to see what I can do.",
		C.Elandra.disable(),
		"Sheriff: And I have a coffee to finish.",
		"Jira: And I...",
		"I wanted to do something.",
		"Jira: I will work with Mr. McPegleg to find Davy Jones!"
	])
