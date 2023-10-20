tool
extends PopochiuProp
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	# Replace the call to .on_interact() to implement your code. This only makes
	# the default behavior to happen.
	# For example you can make the character walk to the Prop and then say
	# something:
#	E.run([
#		C.walk_to_clicked(),
#		C.face_clicked(),
#		'Player: Not picking that up'
#	])
	.on_interact()


# When the node is right clicked
func on_look() -> void:
	# Replace the call to .on_look() to implement your code. This only makes
	# the default behavior to happen.
	# For example you can make the character walk to the Prop and then say
	# something:
#	E.run([
#		C.face_clicked(),
#		'Player: A deck of cards'
#	])
	.on_look()

const POTION_INGREDIENTS = [
	"Flower",
	"Fluorite",
	"Honey",
	"Turnip"
]


func _on_use_bluecup() -> void:
	var num_ingredients := POTION_INGREDIENTS.size()
	if R.Eri0os.state.ingredients_in_bucket < num_ingredients:
		var ingredients_left = num_ingredients - R.Eri0os.state.ingredients_in_bucket
		E.run([
			C.face_clicked(),
			G.display("I can use the cup when the potion is ready, but I still need %d ingredients." % ingredients_left)
		])
		return

	E.run([
		C.walk_to_clicked(),
		C.face_clicked(),
		I.Bluecup.remove(),
		"Player: (Display) I say the conjuring spell here and I get the potion",
		I.Potion.add(),
	])

# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	if POTION_INGREDIENTS.has(item.script_name):
		R.Eri0os.state.ingredients_in_bucket += 1
		yield(E.run([
			C.walk_to_clicked(),
			C.face_clicked(),
			item.remove()
		]), "completed")

	match item.script_name:
		"Bluecup":
			self._on_use_bluecup()
		"Flower":
			pass
		"Fluorite":
			pass
		"Honey":
			pass
		"Turnip":
			pass
		_:
			.on_item_used(item)


# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func on_linked_item_discarded() -> void:
	pass
