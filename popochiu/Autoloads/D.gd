tool
extends "res://addons/Popochiu/Engine/Interfaces/IDialog.gd"

# classes ----
const PDKiosk := preload('res://popochiu/Dialogs/Kiosk/DialogKiosk.gd')
const PDPhil := preload('res://popochiu/Dialogs/Phil/DialogPhil.gd')
# ---- classes

# nodes ----
var Kiosk: PDKiosk setget , get_Kiosk
var Phil: PDPhil setget , get_Phil
# ---- nodes

# functions ----
func get_Kiosk(): return E.get_dialog('Kiosk')
func get_Phil(): return E.get_dialog('Phil')
# ---- functions

