tool
extends PopochiuHotspot
# You can use E.run([]) to trigger a sequence of events.
# Use yield(E.run([]), 'completed') if you want to pause the excecution of
# the function until the sequence of events finishes.


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
# When the node is clicked
func on_interact() -> void:
	on_look()


# When the node is right clicked
func on_look() -> void:
	E.run([
		C.face_clicked(),
		"This table feels very sturdy. I can use it to place... something."
	])


# When the node is clicked and there is an inventory item selected
func on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Bucket":
			R.Eri0os.state.bucket_visible = true
			yield(E.run([
				C.walk_to_clicked(),
				C.face_clicked(),
				disable(),
				item.remove(),
				room.get_prop("Bucket").enable()
			]), "completed")
		_:
			# TODO:
			.on_item_used(item)
