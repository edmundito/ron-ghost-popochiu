tool
extends "res://addons/Popochiu/Engine/Interfaces/IRoom.gd"

# classes ----
const PREri0os := preload('res://popochiu/Rooms/Eri0os/RoomEri0os.gd')
const PRSign := preload('res://popochiu/Rooms/Sign/RoomSign.gd')
const PRTownSquare := preload('res://popochiu/Rooms/TownSquare/RoomTownSquare.gd')
const PRAlley := preload('res://popochiu/Rooms/Alley/RoomAlley.gd')
const PRPostOffice := preload('res://popochiu/Rooms/PostOffice/RoomPostOffice.gd')
const PRGrundysmart := preload('res://popochiu/Rooms/Grundysmart/RoomGrundysmart.gd')
const PRPizzeria := preload('res://popochiu/Rooms/Pizzeria/RoomPizzeria.gd')
const PRStoreBackroom := preload('res://popochiu/Rooms/StoreBackroom/RoomStoreBackroom.gd')
const PRCemetery := preload('res://popochiu/Rooms/Cemetery/RoomCemetery.gd')
const PRCemeteryEntrance := preload('res://popochiu/Rooms/CemeteryEntrance/RoomCemeteryEntrance.gd')
const PRLockerBackroom := preload('res://popochiu/Rooms/LockerBackroom/RoomLockerBackroom.gd')
const PRLockerTownSquare := preload('res://popochiu/Rooms/LockerTownSquare/RoomLockerTownSquare.gd')
const PRCredits := preload('res://popochiu/Rooms/Credits/RoomCredits.gd')
# ---- classes

# nodes ----
var Eri0os: PREri0os setget , get_Eri0os
var Sign: PRSign setget , get_Sign
var TownSquare: PRTownSquare setget , get_TownSquare
var Alley: PRAlley setget , get_Alley
var PostOffice: PRPostOffice setget , get_PostOffice
var Grundysmart: PRGrundysmart setget , get_Grundysmart
var Pizzeria: PRPizzeria setget , get_Pizzeria
var StoreBackroom: PRStoreBackroom setget , get_StoreBackroom
var Cemetery: PRCemetery setget , get_Cemetery
var CemeteryEntrance: PRCemeteryEntrance setget , get_CemeteryEntrance
var LockerBackroom: PRLockerBackroom setget , get_LockerBackroom
var LockerTownSquare: PRLockerTownSquare setget , get_LockerTownSquare
var Credits: PRCredits setget , get_Credits
# ---- nodes

# functions ----
func get_Eri0os(): return .get_runtime_room('Eri0os')
func get_Sign(): return .get_runtime_room('Sign')
func get_TownSquare(): return .get_runtime_room('TownSquare')
func get_Alley(): return .get_runtime_room('Alley')
func get_PostOffice(): return .get_runtime_room('PostOffice')
func get_Grundysmart(): return .get_runtime_room('Grundysmart')
func get_Pizzeria(): return .get_runtime_room('Pizzeria')
func get_StoreBackroom(): return .get_runtime_room('StoreBackroom')
func get_Cemetery(): return .get_runtime_room('Cemetery')
func get_CemeteryEntrance(): return .get_runtime_room('CemeteryEntrance')
func get_LockerBackroom(): return .get_runtime_room('LockerBackroom')
func get_LockerTownSquare(): return .get_runtime_room('LockerTownSquare')
func get_Credits(): return .get_runtime_room('Credits')
# ---- functions

