tool
extends PopochiuProp
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	E.run([
		C.face_clicked(),
		"I wasn't going to pick it up again.",
		"This was a good \"cauldron\" to make the potion.",
	])


# When the node is right clicked
func on_look() -> void:
	E.run([
		C.face_clicked(),
		"It's my \"cauldron\" for the potion.",
	])

func _count_remaining_ingredients() -> int:
	return Globals.POTION_INGREDIENTS.size() - R.Eri0os.state.ingredients_in_bucket

func _on_use_bluecup() -> Array:
	var remaining_ingredients := _count_remaining_ingredients()
	if remaining_ingredients > 0:
		return [
			C.face_clicked(),
			"I can use the cup when the potion is ready, but I still need %d ingredients." % remaining_ingredients
		]

	return [
		C.walk_to_clicked(),
		C.face_clicked(),
		I.Bluecup.remove(),
		"TODO - Anim picking up the drink",
		I.Potion.add(),
		"I needed to drink this near the locker."
	]

# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	var q: Array = []
	var is_ingredient := Globals.POTION_INGREDIENTS.has(item.script_name)

	if is_ingredient:
		R.Eri0os.state.ingredients_in_bucket += 1
		q = [
			C.walk_to_clicked(),
			C.face_clicked(),
			item.remove()
		]

	match item.script_name:
		"Bluecup":
			q.append_array(self._on_use_bluecup())
		"Flower":
			q.append("Jira: A flower close to the dead.")
		"Fluorite":
			q.append("Jira: Fluorite to stimulate the third eye.")
		"Honey":
			q.append("Jira: Nectar of the bees for love and good health.")
		"Turnip":
			q.append("Jira: Turnip greens for luck.")
		_:
			q.append_array([
				C.face_clicked(),
				"%s is not part of the potion ingredients" % item.description
			])

	if is_ingredient and _count_remaining_ingredients() == 0:
		q.append_array([
			E.camera_shake(),
			"Jira: Whoa.",
			"The potion was ready.",
			"Now I needed some kind of container or cup to carry the potion.",
		])

	if q.size() > 0:
		yield(E.run(q), "completed")


# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func on_linked_item_discarded() -> void:
	pass
