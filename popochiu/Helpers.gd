extends Node

func equals(a: PopochiuClickable, b: PopochiuClickable) -> bool:
	return a.script_name == b.script_name

func yield_run(instructions: Array) -> void:
	yield(E.run(instructions), 'completed')

func walk_to_clicked() -> void:
	yield_run([C.walk_to_clicked(), C.face_clicked()])
