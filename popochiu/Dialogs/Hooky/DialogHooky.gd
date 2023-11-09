tool
extends PopochiuDialog


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	var q: Array = [
		"Jira: Hello.",
		"Hooky: Ahoy there.",
	]

	yield(E.run(q), "completed")


func option_selected(opt: PopochiuDialogOption) -> void:
	var q: Array
	var stop_dialog := false

	match opt.id:
		"About":
			q = [
				"TODO - Who is Hooky McPegleg?"
			]

		"Locker":
			q = [
				"Hooky: Get to Davy Jones' Locker in the back room of the general store!",
				"Hooky: There is a potion... take this.",
			]

			if not I.Instructions.in_inventory:
				q.append(I.Instructions.add())
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
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func on_load(data: Dictionary) -> void:
	prints(data)
