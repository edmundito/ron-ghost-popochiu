tool
extends "res://addons/Popochiu/Engine/Interfaces/IInventory.gd"

# classes ----
const PIIPizzaBox := preload('res://popochiu/InventoryItems/PizzaBox/InventoryPizzaBox.gd')
const PIISauce := preload('res://popochiu/InventoryItems/Sauce/InventorySauce.gd')
const PIICheese := preload('res://popochiu/InventoryItems/Cheese/InventoryCheese.gd')
const PIIPepperoni := preload('res://popochiu/InventoryItems/Pepperoni/InventoryPepperoni.gd')
const PIIBucket := preload('res://popochiu/InventoryItems/Bucket/InventoryBucket.gd')
const PIIFlower := preload('res://popochiu/InventoryItems/Flower/InventoryFlower.gd')
const PIITurnip := preload('res://popochiu/InventoryItems/Turnip/InventoryTurnip.gd')
const PIIHoney := preload('res://popochiu/InventoryItems/Honey/InventoryHoney.gd')
const PIIBluecup := preload('res://popochiu/InventoryItems/Bluecup/InventoryBluecup.gd')
const PIIFluorite := preload('res://popochiu/InventoryItems/Fluorite/InventoryFluorite.gd')
const PIIInstructions := preload('res://popochiu/InventoryItems/Instructions/InventoryInstructions.gd')
const PIIPotion := preload('res://popochiu/InventoryItems/Potion/InventoryPotion.gd')
# ---- classes

# nodes ----
var PizzaBox: PIIPizzaBox setget , get_PizzaBox
var Sauce: PIISauce setget , get_Sauce
var Cheese: PIICheese setget , get_Cheese
var Pepperoni: PIIPepperoni setget , get_Pepperoni
var Bucket: PIIBucket setget , get_Bucket
var Flower: PIIFlower setget , get_Flower
var Turnip: PIITurnip setget , get_Turnip
var Honey: PIIHoney setget , get_Honey
var Bluecup: PIIBluecup setget , get_Bluecup
var Fluorite: PIIFluorite setget , get_Fluorite
var Instructions: PIIInstructions setget , get_Instructions
var Potion: PIIPotion setget , get_Potion
# ---- nodes

# functions ----
func get_PizzaBox(): return ._get_item_instance('PizzaBox')
func get_Sauce(): return ._get_item_instance('Sauce')
func get_Cheese(): return ._get_item_instance('Cheese')
func get_Pepperoni(): return ._get_item_instance('Pepperoni')
func get_Bucket(): return ._get_item_instance('Bucket')
func get_Flower(): return ._get_item_instance('Flower')
func get_Turnip(): return ._get_item_instance('Turnip')
func get_Honey(): return ._get_item_instance('Honey')
func get_Bluecup(): return ._get_item_instance('Bluecup')
func get_Fluorite(): return ._get_item_instance('Fluorite')
func get_Instructions(): return ._get_item_instance('Instructions')
func get_Potion(): return ._get_item_instance('Potion')
# ---- functions

