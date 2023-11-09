tool
extends PopochiuDialog

var _state := {
	first_dialog = true,
	game_option_first_time = true,
	trade_option_first_time = true
}

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_start() -> void:
	var q: Array = [
		"Jira: Hello.",
	]

	if _state.first_dialog:
		_state.first_dialog = false
		q.append_array([
			"Julia: Oh, hi!",
			"Julia: Would you know where the town's square is located?",
			"..",
			"Jira: This is it.",
			"...",
			"Julia: Oh.",
		])
	else:
		q.append("Julia: Hello again!")

	yield(E.run(q), 'completed')


func option_selected(opt: PopochiuDialogOption) -> void:
	var q: Array
	var stop_dialog := false

	match opt.id:
		"Visiting":
			turn_off_forever_options(["Visiting"])
			turn_on_options(["Game"])
			C.Julia.description = "Julia"
			C.Julia.state.met_julia = true
			q = [
				"Jira: I'm Jira.",
				"Julia: Hi, Jira, I'm Julia!",
				"Jira: Hi, J, I'm J!",
				"Julia: Haha, yes!",
				"Jira: What brings you to town?",
				"Julia: I'm visiting from Canada.",
				"Julia: I read about the Reality-on-the-Norm Autumn Festival and dediced to visit for a few days.",
				"Julia: Then I'm heading to a conference to demo my video game, The Crimson Diamond."
			]

		"Game":
			if _state.game_option_first_time:
				turn_on_options(["Mineralogy"])
				q = [
					"Jira: Tell me about The Crimson Diamond.",
					"Julia: Why it's an extraordinary mystery house adventure set in Ontario, Canada...",
					"Julia: ...with stunning, low-resolution, retro pixel graphics...",
					"Julia: ...a sophisticated score created with a Roland MT-32 synthesiser.",
					"Julia: Not to mention the detailed animation and character close-ups...",
					"Julia: ...and a text parser interface!",
					"Jira: So, what do you do in the game?",
				]
			else:
				q = [
					"Jira: What is The Crimson Diamond about, again?"
				]

			q.append_array([
				"Julia: You play as Nancy Maple, an aspiring mineralogist assigned to follow the trail of a dazzling diamond.",
				"Julia: There's an intriguing cast of characters has converged into one roof, each meaning to get their own way... or else!",
				"Julia: Nancy has to untangle the mysteries and machinations before it's too late.",
			])

			if _state.game_option_first_time:
				q.append_array([
					"Jira: I love mystery games!",
					"Julia: Good to hear!",
				])

			q.append_array([
				"Julia: You can visit www.thecrimsondiamond.com to download the demo!",
			])

			_state.game_option_first_time = false

		"Mineralogy":
			if C.Julia.state.talked_about_minerals:
				q = [
					"Jira: So, you collect minerals....",
					"Julia: Yep!",
				]
			else:
				q = [
					"Jira: What's Mineralogist?",
					"Julia: It's someone who studies minerals.",
					"Jira: Minerals?",
					"Julia: Minerals are crystals, gemstones, that sort of thing.",
					"Jira: How did you incorporate it into your game?",
					"Julia: I'm very interest in collecting minerals.",
				]

			q.append_array([
				"Julia: I even brought a few to show around.",
				"Julia: Let me know if you'd like to see one!",
			])

			if not C.Julia.state.talked_about_minerals:
				q.append_array([
					"This sounded useful, but I couldn't come up with any names for minerals, except for...",
					"Jira: You mentioned diamonds.",
					"Jira: Do you have one?",
					"Julia: Ironically, I don't!",
					"Julia: But you give me a name and I might have it.",
				])
				C.Julia.state.talked_about_minerals = true

		"Sauce":
			turn_off_forever_options(["Sauce"])
			turn_on_options(["Trade"])
			q = [
				"Jira: Did you happen to buy the last jar of Lucca's Chunky Marinara from the Grundysmart?",
				"Julia: Why yes!",
				"Julia: I wanted to get a souvenir to take with me, and I heard this sauce is a staple of this town.",
				"Julia: I heard it has a unique taste.",
				"Jira: Yep, it's the ginger."
			]

		"Trade":
			q = [
				"Jira: Would you be able to trade the sauce for something else?",
			]

			if _state.trade_option_first_time:
				_state.trade_option_first_time = false
				q.append_array([
					"Julia: Maybe.",
					"Julia: What's your interest in the sauce?",
					"Jira: I'd really like use the sauce.",
					"Jira: It's for something... urgent.",
					"Julia: Well...",
				])

			q.append_array([
				"Julia: I may be willing to trade if you bring me another staple food from this town."
			])

		"Bye":
			q = [
				"Jira: I need to get going.",
				"Julia: Bye!",
			]
			stop_dialog = true
		_:
			stop_dialog = true

	if q.size() > 0:
		yield(E.run_cutscene(q), "completed")

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
