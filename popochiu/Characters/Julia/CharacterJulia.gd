tool
extends PopochiuCharacter

const Data := preload('CharacterJuliaState.gd')

var state: Data = preload('CharacterJulia.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	yield(E.run([
		C.walk_to_clicked(),
		C.face_clicked()
	]), "completed")
	D.Julia.start()


# When the node is right clicked
func on_look() -> void:
	var message: String = (
		"It's Julia, a game developer from Canada."
		if state.met_julia else
		"It's probably another tourist coming to the autumn festival."
	)

	E.run([C.face_clicked(), message])

func _get_give_instructions_q() -> Array:
	if state.gave_fluroite:
		if state.showed_instructions_after_fluorite:
			return [
				"Julia: It's your magic potion!",
				"Jira: Yes, it is!",
				"Julia was being polite, and probably was no longer interested in this."
			]

		state.showed_instructions_after_fluorite = true
		return [
			"Julia: I wanted to show you something.",
			"Julia: This looks like a recipe.",
			"Julia: What is it for?",
			"Jira: It's for... a... magic potion.",
			"Julia: Oh.",
			"...",
			"Julia: Some people believe that Fluorite has magical properties.",
			"Julia: I hope it serves you well!"
		]

	elif state.talked_about_minerals:
		state.gave_fluroite = true
		I.set_active_item(null)
		return [
			"Jira: Julia, would you be able to help me with something?",
			"Julia: Sure, what is it?",
			"Jira: I'm trying to find something called fluorite.",
			"Julia: Fluorite is a mineral!",
			"Julia: I just so happen to have a few crystals with me.",
			"Julia: Would you like one?",
			"Jira: That would be very helpful.",
			"Julia: Here you go!",
			I.Fluorite.add(),
		]

	else:
		return [
			"Julia: What's this?",
			"Jira: It's for a...",
			"Jira: Nothing.",
			"I thought Julia could help, but I was too embarassed to tell her what it was for a potion.",
			"Maybe if I knew more about how she could help me, first...."
		] if state.met_julia else [
			"Julia: Thanks, but I don't take flyers from strangers.",
		]


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	var q: Array

	match item.script_name:
		"Instructions":
			q = self._get_give_instructions_q()
		"Flourite":
			q = [
				"Julia: I hope it's useful to you!"
			]
		"Bucket":
			q = [
				"Player: Check out my bucket.",
				"Julia: Oooh, I love buckets!"
			]
		_:
			# TODO: Customize
			.on_item_used(item)
			return

	if q.size() > 0:
		q.push_front(C.face_clicked())
		q.push_front(C.walk_to_clicked())
		E.run(q)


# Use it to play the idle animation for the character
func play_idle() -> void:
	.play_idle()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func play_walk(target_pos: Vector2) -> void:
	.play_walk(target_pos)


# Use it to play the talk animation for the character
func play_talk() -> void:
	.play_talk()


# Use it to play the grab animation for the character
func play_grab() -> void:
	.play_grab()
