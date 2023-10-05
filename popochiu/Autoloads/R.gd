tool
extends "res://addons/Popochiu/Engine/Interfaces/IRoom.gd"

# classes ----
const PREri0os := preload('res://popochiu/Rooms/Eri0os/RoomEri0os.gd')
const PRSign := preload('res://popochiu/Rooms/Sign/RoomSign.gd')
# ---- classes

# nodes ----
var Eri0os: PREri0os setget , get_Eri0os
var Sign: PRSign setget , get_Sign
# ---- nodes

# functions ----
func get_Eri0os(): return .get_runtime_room('Eri0os')
func get_Sign(): return .get_runtime_room('Sign')
# ---- functions

