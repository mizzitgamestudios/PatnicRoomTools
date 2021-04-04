extends Node
class_name FormFieldAttributes


var input

var componentName:    String
var description:      String

var size:             Vector2
var pos:              Vector2

var nameToShow:       String
var suggestion:       String

var validInputs:      Array
var validType:        String
var dataTypeToString: String

var style:            StyleBoxFlat

var scene:            Node2D


func initialice(dict:Dictionary,numberofField:int,scenePara:Node2D) -> void:
	setByDictionary(dict)
	var width        = Utils.getWidth(validType)
	
	pos              = getPosOfCurrentFormEntry(numberofField)
	dataTypeToString = Utils.getDataToString(validType)
	style            = Utils.getStyle(validType) 
	size             = Vector2(width, 20)
	scene            = scenePara



func setByDictionary(dict:Dictionary):
	description      = dict["description"]
	suggestion       = dict["suggestion"]
	validInputs      = dict["validInputs"]
	validType        = dict["validType"]
	nameToShow       = dict["nameToShow"]
	componentName    = dict["componentName"]




func getPosOfCurrentFormEntry(counter:int):
	var pos = Vector2(450,0)
	counter +=1
	
	for i in counter:
		pos.y += 20
		pos.y += 10
		
	return pos
