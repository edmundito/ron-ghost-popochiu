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

	if should_play_intro_cutscene():
		get_prop("Flower").disable(false)
	else:
		get_region("IntroTrigger").enabled = false
		C.Sorendo.disable(false)

	C.Jira.position = get_hotspot("Exit").walk_to_point

# What happens when the room changing transition finishes. At this point the room
# is visible.
func on_room_transition_finished() -> void:
	var q: Array = [
		C.player.walk_to_room_point("StartPos")
	]

	if should_play_intro_cutscene():
		q.append_array([
			"I wasn't fond of graveyards, but my friend, Sorendo, wanted to meet in a secluded place.",
			"In the past few weeks, a couple of students have disappeared.",
			"Sorendo is convinced that he found who's behind it...."
		])
		yield(E.run_cutscene(q), "completed")
	else:
		E.run(q)

# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func on_room_exited() -> void:
	pass


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# You could put public functions here

func run_intro_cutscene() -> void:
	if not should_play_intro_cutscene():
		return

	var q: Array = [
		C.Jira.walk_to_hotspot("DavyGrave"),
		"Sorendo: Jira!",
		"Sorendo: At last.",
		"Jira: Sorry I'm late.",
		"Jira: It took me a while to sneak out of the house without my parents noticing.",
		"Sorendo: Understandable.",
		"Jira: What is this pentagram all about?",
		"Sorendo: It's part of a spell.",
		"Jira: Huh?",
		"Jira: I thought you wanted to tell me who is behind the kidnappings.",
		"Sorendo: Yep, the spell is part of it.",
		"Sorendo: This kid, Davy Jones.",
		"Sorendo: I saw his ghost, and take Sol away a few days ago.",
		"Jira: Solomon... one of the kids that disappeared?",
		"Sorendo: Yeah.",
		"Sorendo: My mum went to school with Davy, and I happened to find his journal of spells in our attic.",
		"Jira: OK, so...?",
		"Sorendo: My plan is to bring him to life and ask him why he is doing this.",
		"Jira: So, this is...",
		"Sorendo: ...a resurrection, from a spell I found in the book.",
		"Sorendo: It reads to draw a pentagram.",
		"Sorendo: Then to chant, 'Role heck-a-tar come babbles come stow-sheb role say-bite-tus'...",
		E.camera_shake(),
		"Sorendo: Wait...",
		"Sorendo: I didn't mean to...",
		C.Davy.enable(),
		"Davy: You can't just recite the spell and expect it to work.",
		"Davy: You need the gift, and also how to pronounce the chant well.",
		"Sorendo: Davy Jones?",
		"Davy: You dare to disturb my grave.",
		"Sorendo: Well, you've been kidnapping my friends.",
		"...",
		"Davy: Fair, but it's hard to explain.",
		"Davy: Come with me, I'll show you what I'm doing.",
		"Sorendo: Huh?",
		"Davy: Step in to my locker...",
		"Sorendo: Now, wait a...",
		C.Davy.disable(),
		C.Sorendo.disable(),
		"...",
		"Jira: Oh no.",
		"I didn't know what exactly happened, but I needed to find help.",
	]

	yield(E.run_cutscene(q), "completed")

func should_play_intro_cutscene() -> bool:
	return C.player.last_room == "Sign" and state.visited_first_time

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PRIVATE ░░░░
# You could put private functions here

