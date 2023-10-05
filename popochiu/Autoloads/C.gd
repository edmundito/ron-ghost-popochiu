tool
extends "res://addons/Popochiu/Engine/Interfaces/ICharacter.gd"

# classes ----
const PCJira := preload('res://popochiu/Characters/Jira/CharacterJira.gd')
const PCHooky := preload('res://popochiu/Characters/Hooky/CharacterHooky.gd')
const PCElandra := preload('res://popochiu/Characters/Elandra/CharacterElandra.gd')
const PCSheriff := preload('res://popochiu/Characters/Sheriff/CharacterSheriff.gd')
const PCPhil := preload('res://popochiu/Characters/Phil/CharacterPhil.gd')
# ---- classes

# nodes ----
var Jira: PCJira setget , get_Jira
var Hooky: PCHooky setget , get_Hooky
var Elandra: PCElandra setget , get_Elandra
var Sheriff: PCSheriff setget , get_Sheriff
var Phil: PCPhil setget , get_Phil
# ---- nodes

# functions ----
func get_Jira(): return .get_runtime_character('Jira')
func get_Hooky(): return .get_runtime_character('Hooky')
func get_Elandra(): return .get_runtime_character('Elandra')
func get_Sheriff(): return .get_runtime_character('Sheriff')
func get_Phil(): return .get_runtime_character('Phil')
# ---- functions

