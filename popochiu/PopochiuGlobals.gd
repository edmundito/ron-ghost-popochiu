extends Node

enum PhilKioskPuzzle {
	TALK_TO_PHIL,
	GET_PIZZA_BOX,
	BUILD_PIZZA,
	DESTROYED_KIOSK,
	COMPLETE,
}

var puzzles := {
	PHIL_KIOSK = PhilKioskPuzzle.TALK_TO_PHIL,
}

func set_phil_kiosk_state(value) -> void:
	puzzles.PHIL_KIOSK = value

func completed_phil_kiosk_state(value) -> bool:
	return puzzles.PHIL_KIOSK > value

var state := {
}
