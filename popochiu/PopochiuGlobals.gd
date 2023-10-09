extends Node

enum PhilKioskPuzzle {
	TALK_TO_PHIL,
	GET_PIZZA_BOX,
	BUILD_PIZZA,
	DESTROYED_KIOSK,
}

var puzzles := {
	PHIL_KIOSK = PhilKioskPuzzle.TALK_TO_PHIL,
}

func set_get_pizza_box() -> void:
	puzzles.PHIL_KIOSK = PhilKioskPuzzle.GET_PIZZA_BOX

func set_build_pizza() -> void:
	puzzles.PHIL_KIOSK = PhilKioskPuzzle.BUILD_PIZZA

func talked_to_phil() -> bool:
	return puzzles.PHIL_KIOSK > PhilKioskPuzzle.TALK_TO_PHIL

func got_pizza_box() -> bool:
	return puzzles.PHIL_KIOSK > PhilKioskPuzzle.GET_PIZZA_BOX

func destroyed_kiosk() -> bool:
	return puzzles.PHIL_KIOSK == PhilKioskPuzzle.DESTROYED_KIOSK

var state := {
	GOT_PIZZA_BOX = true,
	HAD_PIZZA_CONVO_WITH_PHIL = false,
	DESTROYED_KIOSK = false,
}
