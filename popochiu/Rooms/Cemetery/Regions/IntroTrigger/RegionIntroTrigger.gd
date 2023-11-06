tool
extends PopochiuRegion


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ VIRTUAL ░░░░
func on_character_entered(chr: PopochiuCharacter) -> void:
	if self.enabled:
		self.enabled = false
		C.player.stop_walking(false)
		R.Cemetery.run_intro_cutscene()


func on_character_exited(chr: PopochiuCharacter) -> void:
	pass
