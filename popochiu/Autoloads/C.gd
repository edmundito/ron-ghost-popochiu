tool
extends "res://addons/Popochiu/Engine/Interfaces/ICharacter.gd"

# classes ----
const PCJira := preload('res://popochiu/Characters/Jira/CharacterJira.gd')
# ---- classes

# nodes ----
var Jira: PCJira setget , get_Jira
# ---- nodes

# functions ----
func get_Jira(): return .get_runtime_character('Jira')
# ---- functions

