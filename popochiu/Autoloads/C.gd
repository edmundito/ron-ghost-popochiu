tool
extends "res://addons/Popochiu/Engine/Interfaces/ICharacter.gd"

# classes ----
const PCJira := preload('res://popochiu/Characters/Jira/CharacterJira.gd')
const PCHooky := preload('res://popochiu/Characters/Hooky/CharacterHooky.gd')
const PCElandra := preload('res://popochiu/Characters/Elandra/CharacterElandra.gd')
const PCSheriff := preload('res://popochiu/Characters/Sheriff/CharacterSheriff.gd')
const PCPhil := preload('res://popochiu/Characters/Phil/CharacterPhil.gd')
const PCKiosk := preload('res://popochiu/Characters/Kiosk/CharacterKiosk.gd')
const PCPizzaWorker := preload('res://popochiu/Characters/PizzaWorker/CharacterPizzaWorker.gd')
const PCJulia := preload('res://popochiu/Characters/Julia/CharacterJulia.gd')
const PCSorendo := preload('res://popochiu/Characters/Sorendo/CharacterSorendo.gd')
const PCDavy := preload('res://popochiu/Characters/Davy/CharacterDavy.gd')
# ---- classes

# nodes ----
var Jira: PCJira setget , get_Jira
var Hooky: PCHooky setget , get_Hooky
var Elandra: PCElandra setget , get_Elandra
var Sheriff: PCSheriff setget , get_Sheriff
var Phil: PCPhil setget , get_Phil
var Kiosk: PCKiosk setget , get_Kiosk
var PizzaWorker: PCPizzaWorker setget , get_PizzaWorker
var Julia: PCJulia setget , get_Julia
var Sorendo: PCSorendo setget , get_Sorendo
var Davy: PCDavy setget , get_Davy
# ---- nodes

# functions ----
func get_Jira(): return .get_runtime_character('Jira')
func get_Hooky(): return .get_runtime_character('Hooky')
func get_Elandra(): return .get_runtime_character('Elandra')
func get_Sheriff(): return .get_runtime_character('Sheriff')
func get_Phil(): return .get_runtime_character('Phil')
func get_Kiosk(): return .get_runtime_character('Kiosk')
func get_PizzaWorker(): return .get_runtime_character('PizzaWorker')
func get_Julia(): return .get_runtime_character('Julia')
func get_Sorendo(): return .get_runtime_character('Sorendo')
func get_Davy(): return .get_runtime_character('Davy')
# ---- functions

