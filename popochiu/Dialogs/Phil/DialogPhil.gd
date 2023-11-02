tool
extends PopochiuDialog

var _state := {
	first_dialog = true
}

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	if C.Phil.state.ate_pizza:
		turn_off_forever_options(["Pizza"])

	var phil_line: String

	if C.Phil.room.script_name == R.Alley.script_name:
		if _state.first_dialog:
			phil_line = "Phil: Got a dollar?"
		elif (
			Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL) and
			!Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX)
		):
			phil_line = "Phil: How's my pizza coming along?"
		else:
			phil_line = "Phil: Yeh?"

	var q: Array = [
		"Jira: Hello.",
		phil_line
	]

	_state.first_dialog = false
	if q.size() > 0:
		yield(E.run(q), "completed")


func option_selected(opt: PopochiuDialogOption) -> void:
	var q: Array
	var end_dialog := false
	var next_room: String

	match opt.id:
		"Kiosk":
			q = [
				"Jira: You look a lot like the A.I. at the Grundysmart.",
			]
			if !C.Phil.state.ate_pizza:
				q.append_array([
					"Phil: Yeh, but I don't want to talk about this.",
					"Phil: I just want to eat!"
				])
			else:
				q.append_array([
					"Phil: They based that dang A.I. on me!",
					"Phil: I used to be the general store's most loyal employee!",
					"Phil: When Mr. Yahtzee abandoned us, Grundy took over and started making changes.",
					"Phil: Our salaries stayed the same, not a lot of benefits.",
					"Phil: And then one day there was a big bang event to introduce their A.I. kiosks.",
					"Phil: I demanded to get compensation for my likeness bug H.R. looked at me like a chicken staring at salt!",
					"Phil: But not before the layoffs...",
					"Phil: And I haven't been able to find a job ever since.",
					"Phil: But I know A LOT of their secrets."
				])
				opt.turn_off_forever()
				turn_on_options(["Backdoor"])
		"Backdoor":
			opt.turn_off_forever()
			Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.DESTROY_KIOSK)
			next_room = "Grundysmart"
			end_dialog = true
			q = [
				"Jira: I need to get to the back of the store, but I can't get past the A.I.",
				"Jira: Would you be able to help me?",
				"Phil: That dang kiosk is hackable, and I know how.",
				"Phil: Let's go there and see what I can do.",
			]
		"Dollar":
			opt.turn_off_forever()
			turn_on_options(["Kiosk", "Pizza"])
			q = [
				"Jira: Sorry, I don't have any cash on hand.",
				"Jira: Is there any way I could help?",
				"Phil: I'm so hungry, I could eat a whole pizza!"
			]
		"Pizza":
			if !Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
				Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.GET_PIZZA_BOX)
				q = [
					"Jira: I might be able to get you a pizza.",
					"Phil: Really?",
					"Phil: Thank you!",
					"Jira: What do you like?",
					"Phil: Peperoni sounds delicious right now."
				]
			else:
				q = [
					"Jira: What kind of pizza did you want, again?",
					"Phil: Sauce, Cheese, Pepperoni.",
					"Jira: Bet."
				]
		"Bye":
			q = [
				"Jira: See ya."
			]
			end_dialog = true

	if q.size() > 0:
		yield(E.run(q), "completed")

	if end_dialog:
		stop()
	else:
		_show_options()

	if next_room:
		E.goto_room(next_room)


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
