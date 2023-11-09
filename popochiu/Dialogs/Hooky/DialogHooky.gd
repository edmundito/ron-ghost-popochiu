tool
extends PopochiuDialog

var _state := {
}

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	var q: Array = [
		"Jira: Mr. McPegleg?",
		"Hooky: Arr.",
	]

	yield(E.run(q), "completed")


func option_selected(opt: PopochiuDialogOption) -> void:
	var q: Array
	var stop_dialog := false

	match opt.id:
		"About":
			opt.turn_off_forever()
			turn_on_options(["AboutMore"])
			q = [
				"Jira: It seems that people recognize you here....",
				"Jira: How?",
				"Hooky: Well, I can start from the beginning.",
				"Hooky: I was born in St. Louis, and I always dreamed of becoming a pirate.",
				"Hooky: In my 20's, I sailed through the Caribbean sea and eventually got my own ship.",
				"Hooky: I spent all my wealth on the ship, but I heard about a lost treasure of RON and sailed here to find it.",
				"Hooky: This was maybe roughly twenty years ago, around the time Davy Jones had died.",
				"Hooky: I recall Elandra was having hard time with this, she was just a teen.",
				"Hooky: A zombie that Davy Jones revived had won the election, and appointed me as a postman.",
				"Jira: Weird!",
				"But it was no weirder than a modern-day pirate of the Caribbean, I guess.",
				"Hooky: Long story short, I later found the treasure, quit as postman, and sailed away thinking I would never return.",
			]
		"MoreAbout":
			opt.turn_off_forever()
			q = [
				"Jira: What have you been up to since then?",
				"Hooky: I've been saling the world, looking all kinds of treasures.",
				"Hooky: Davy Jones's locker is one that I've been searching for a long time.",
				"Hooky: Other treasurs include investing in startups, cryptocurrencies, and digital assets.",
				"Hooky: I also took a break southeast in Indonesia for a while.",
				"Hooky: And I started a podcast.",
				"Hooky: Would you like to listen to it?",
				"Jira: Hmm...",
				"Jira: No, thanks."
			]

		"Locker":
			opt.turn_off_forever()
			turn_on_options(["LockerHow"])
			q = [
				"Jira: What is Davy Jones's Locker?",
				"Jira: Isn't it just a pirate myth?",
				"Hooky: Not just a myth!",
				"Hooky: Stories tell Davy Jones has been collecting souls for ages.",
				"Hooky: He was been working with the grim reaper for years, doing his bidding.",
				"Hooky: And bhehind his locker there is a land with immense amount of wealth which contains all of taken souls's posessions.",
				"Hooky: He can take many forms depending on where he is, and he is difficult to track.",
				"Hooky: I believe that the Davy Jones in this town is the same of legend, coincidentially taking the form of an existing Davy Jones.",
			]
		"LockerHow":
			q = [
				"Jira: What do I need to do, again?",
				"Hooky: Get to the locker behind the general store.",
				"Hooky: Make the potion that is written on the note.",
				"Hooky: I'll meet you by the locker when you have everything ready.",
				"Jira: Right."
			] if I.Instructions.in_inventory else [
				"Jira: What can I do to find the locker?",
				"Hooky: What you need to do is get to the locker and open it...",
				"Hooky: Then we can go in and rescue your friend.",
				"Jira: If Davy Jones has taken the form of our Davy Jones, wouldn't his locker be at... a school?",
				"Hoory: I had the same thought!",
				"Hooky: I went to find the location of Davy's school locker, but when I got there it was gone!",
				"Jira: Gone?",
				"Hooky: Yes, talking around, I found that the lockers were sold to someone named Grundy in order to get more funds for the school.",
				"Hooky: Which led me to learn that the locker is most likely hidden somewhere in Grundy's general store.",
				"Hooky: Unfortunately, security is tight there, and we need to find a way around it.",
				"Hooky: And finally, we need to cast some kind of spell to open the door.",
				"Jira: A spell?",
				"Hooky: My search in the school wasn't completely futile.",
				"Hooky: I found this note tucked under one of the floor tiles.",
				I.Instructions.add(),
				"Jira: This looks like...",
				"Jira: ...a recipe for a potion.",
				"Hooky: Oh, that's it!",
				"Jira: So, I need to find the locker at the general store...",
				"Hooky: Aye.",
				"Jira: ...and I need to put this potion together to open the locker.",
				"Hooky: Aye aye.",
			]
		_:
			stop_dialog = true

	if q.size() > 0:
		yield(E.run(q), "completed")

	if stop_dialog:
		stop()
	else:
		_show_options()


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func on_save() -> Dictionary:
	return _state


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func on_load(data: Dictionary) -> void:
	_state = data
