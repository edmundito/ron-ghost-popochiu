tool
extends "res://addons/Popochiu/Engine/Interfaces/IInventory.gd"

# classes ----
const PIIPizzaBox := preload('res://popochiu/InventoryItems/PizzaBox/InventoryPizzaBox.gd')
const PIISauce := preload('res://popochiu/InventoryItems/Sauce/InventorySauce.gd')
const PIICheese := preload('res://popochiu/InventoryItems/Cheese/InventoryCheese.gd')
const PIIPepperoni := preload('res://popochiu/InventoryItems/Pepperoni/InventoryPepperoni.gd')
# ---- classes

# nodes ----
var PizzaBox: PIIPizzaBox setget , get_PizzaBox
var Sauce: PIISauce setget , get_Sauce
var Cheese: PIICheese setget , get_Cheese
var Pepperoni: PIIPepperoni setget , get_Pepperoni
# ---- nodes

# functions ----
func get_PizzaBox(): return ._get_item_instance('PizzaBox')
func get_Sauce(): return ._get_item_instance('Sauce')
func get_Cheese(): return ._get_item_instance('Cheese')
func get_Pepperoni(): return ._get_item_instance('Pepperoni')
# ---- functions

