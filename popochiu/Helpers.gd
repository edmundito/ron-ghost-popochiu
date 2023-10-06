extends Node

func yield_run(instructions: Array) -> void:
	yield(E.run(instructions), 'completed')

func walk_to_clicked() -> void:
	yield_run([C.walk_to_clicked(), C.face_clicked()])
