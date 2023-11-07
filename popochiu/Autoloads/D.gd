tool
extends "res://addons/Popochiu/Engine/Interfaces/IDialog.gd"

# classes ----
const PDKiosk := preload('res://popochiu/Dialogs/Kiosk/DialogKiosk.gd')
const PDPhil := preload('res://popochiu/Dialogs/Phil/DialogPhil.gd')
const PDHooky := preload('res://popochiu/Dialogs/Hooky/DialogHooky.gd')
const PDJulia := preload('res://popochiu/Dialogs/Julia/DialogJulia.gd')
# ---- classes

# nodes ----
var Kiosk: PDKiosk setget , get_Kiosk
var Phil: PDPhil setget , get_Phil
var Hooky: PDHooky setget , get_Hooky
var Julia: PDJulia setget , get_Julia
# ---- nodes

# functions ----
func get_Kiosk(): return E.get_dialog('Kiosk')
func get_Phil(): return E.get_dialog('Phil')
func get_Hooky(): return E.get_dialog('Hooky')
func get_Julia(): return E.get_dialog('Julia')
# ---- functions

