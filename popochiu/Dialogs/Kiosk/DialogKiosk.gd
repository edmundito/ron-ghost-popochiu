tool
extends PopochiuDialog

var _state := {
	back_door_first_time = true,
	first_time = true,
	shocked = true,
}

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	# One can put here something to excecute before showing the dialog options.
	# E.g. Make the PC to look at the character which it will talk to, walk to
	# it, and say something (or make the character say something)
	# (!) It MUST always use a yield

	if Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL):
		turn_off_forever_options(["Phil"])
	elif R.Alley.state.visited:
		turn_on_options(["Phil"])

	var instructions: Array = [
		"Jira: Excuse me."
	]

	if _state.first_time:
		_state.first_time = false
		instructions.append_array([
			"Kiosk: Hi!",
			'Kiosk: Did you know that Grundysmart hourly employees are eligible for fully paid tuition after three months on the job?',
		])
	else:
		instructions.append_array([
			"Kiosk: How can I help you, Jira?",
		])
		if _state.shocked:
			_state.shocked = false
			instructions.append_array([
				"Jira: Uhh... How did you know my name?",
				"Kiosk: We learn everything about our customers so that we can provide a personalized experience.",
				"Jira: But I don't have a Grundysmart account?",
				"Kiosk: Our records indicate that your Ciro Navarro has authorized access for you to purchase here.",
				"Jira: Oh.",
				"Jirao: Ciro is my dad.",
				"Kiosk: I know."
			])

	yield(E.run(instructions), "completed")


func option_selected(opt: PopochiuDialogOption) -> void:
	#	yield(D.say_selected(), 'completed')
	var instructions: Array
	var end_dialog := false

	match opt.id:
		'BackDoor':
			instructions = [
				"Jira: Would it be possible for me to go through that door behind you?",
			]
			if _state.back_door_first_time:
				_state.back_door_first_time = false
				instructions.append_array([
					"Kiosk: Sorry, but the back room is for employees only.",
					"Jira: But you have no employees.",
					"Kiosk: ...",
				])
			instructions.append("Kiosk: Sorry, but that door is for authorized users only.")

		'Pay':
			instructions = [
				"Jira: Are you the checkout counter?",
				"Jira: How do I pay?",
				"Kiosk: Easy: You can walk out and we'll check out automatically for you!",
				"Jira: But how...?",
				"Kiosk: Using our innovative human recognition technology.",
				"Kiosk: Your payment settings in our app, we will recognize the items you're carrying out and do the checkout process for you.",
				"Jira: OK..."
			]
		'Grundy':
			opt.turn_off()
			instructions = [
				"Jira: So, who is Grundy?",
				"Kiosk: F. Joseph Grundy is the founder, CEO, and Chairman of the Board for Grundysmart.",
				"Kiosk: He had his humble beginnings here, in Reality-on-the-Norm, with just one convenience store.",
				"Kiosk: He is a man with a visionary leadership, and dedicated to making a difference in the lives for customers.",
				"Kiosk: Today, Grundysmart has over...",
				"Jira: OK, I heard enough!",
				"Jira: Thanks."
			]
		'Tuition':
			opt.turn_off()
			instructions = [
				'Player: Free college tuition?',
				'Player: Sign me up!',
				'Kiosk: Great! I will check to see if we have any applications available...',
				'Kiosk: ...',
				'Kiosk: Unfortunately, we have no openings at this time.',
				'Player: Well, I read that you replaced all of your hourly employees with kiosks, so do you have any hourly jobs?',
				'Kiosk: ...',
				'Kiosk: That is correct. We no longer offer hourly jobs.'
			]
		'Phil':
			if not Globals.completed_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_KIOSK):
				Globals.set_phil_kiosk_state(Globals.PhilKioskPuzzle.TALK_TO_PHIL)
			instructions = [
				"Jira: You look like a man living behind Eri0o's Cafe.",
				"Kiosk: That's impossible!",
				"Kiosk: My resemblance was generated through deep learning technology to resemble the friendliest general store representative.",
			]
		'Bye':
			instructions = [
				'Player: That is all.',
				'Kiosk: Have a wonderful day%s!' % ("" if _state.shocked else ", Jira")
			]
			end_dialog = true

	if instructions.size() > 0:
		yield(E.run(instructions), "completed")

	if end_dialog:
		stop()
		return

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
	prints(data)
	_state = data
