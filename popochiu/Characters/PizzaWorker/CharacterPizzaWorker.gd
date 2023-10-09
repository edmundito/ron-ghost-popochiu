tool
extends PopochiuCharacter

const Data := preload('CharacterPizzaWorkerState.gd')

var state: Data = preload('CharacterPizzaWorker.tres')


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the PopochiuRoom where this node was already loaded
func on_room_set() -> void:
	pass


# When the node is clicked
func on_interact() -> void:
	if Globals.got_pizza_box():
		E.run(['Player: I already have a pizza box'])
	elif !Globals.talked_to_phil():
		E.run(['Player: I need to talk to phil first'])
	else:
		E.run([
	    C.walk_to_clicked(),
	    "Player: One Pepperoni pizza",
			"PizzaWorker: Here you go!",
	    I.PizzaBox.add()
	  ])



# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	.on_look()


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	.on_item_used(item)


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
