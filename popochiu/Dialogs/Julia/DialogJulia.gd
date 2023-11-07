tool
extends PopochiuDialog


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	var q: Array = [
		"Julia: Oh, hi!",
		"Julia: I'm looking for the town square. Do you know where it is?",
		"Player: This is it.",
		"Julia: Oh.",
		"Some more dialog here...",
		"Julia: I'm an expert on minerals!"
	]

	C.Julia.description = "Julia"
	C.Julia.state.talked_about_minerals = true
	yield(E.run(q), 'completed')


func option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	yield(D.say_selected(), 'completed')

	# Use match to check which option was selected and excecute something for
	# each one
	match opt.id:
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
			stop()

	_show_options()


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ PUBLIC ░░░░
# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func on_load(data: Dictionary) -> void:
	prints(data)
