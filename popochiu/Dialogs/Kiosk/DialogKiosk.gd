tool
extends PopochiuDialog


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	# One can put here something to excecute before showing the dialog options.
	# E.g. Make the PC to look at the character which it will talk to, walk to
	# it, and say something (or make the character say something)
	# (!) It MUST always use a yield
	yield(E.run([
		'Kiosk: Welcome to Grundysmart Bodega, the Universe\'s most customer-centric convenience store!',
		'Kiosk: Did you know that Grundysmart hourly employees are eligible for fully paid tuition after three months on the job?',
	]), 'completed')


func option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
#	yield(D.say_selected(), 'completed')

	# Use match to check which option was selected and excecute something for
	# each one
	match opt.id:
		'College':
			yield(E.run([
				'Player: Free college tuition?',
				'Player: Sign me up!',
				'Kiosk: Great! I will check to see if we have any applications available...',
				'Kiosk: ...',
				'Kiosk: Unfortunately, we have no openings at this time.',
				'Player: That is because you got replaced all of your hourly employees with kiosks!',
				'Kiosk: ...',
				'Kiosk: That is correct.'
			]), 'completed')
			opt.turn_off()

		'Bye':
			yield(E.run([
				'Player: That is all.',
				'Kiosk: Have a wonderful day!'
			]), 'completed')

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
