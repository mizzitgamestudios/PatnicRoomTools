extends Node
class_name EffectCache

var isActive         : bool

var triggerSpecific  : Array
var triggerBase      : String

var effectCondition  : Array
var effectStatmod    : Array

var spaceMedium      : String
var spaceSource      : String
var spaceReach       : String
var spaceMType       : String

func _init() -> void:
	isActive = false


func getIsActive(): return isActive
