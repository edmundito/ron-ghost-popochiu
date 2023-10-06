tool
extends "res://addons/Popochiu/Engine/Interfaces/IDialog.gd"

# classes ----
const PDKiosk := preload('res://popochiu/Dialogs/Kiosk/DialogKiosk.gd')
# ---- classes

# nodes ----
var Kiosk: PDKiosk setget , get_Kiosk
# ---- nodes

# functions ----
func get_Kiosk(): return E.get_dialog('Kiosk')
# ---- functions

