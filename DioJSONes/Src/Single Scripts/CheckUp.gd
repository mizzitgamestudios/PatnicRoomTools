extends Node

var allNodesOfForms = {}
var listOfValidAttributes = []



func fullCheckUp():
	var isAlertless = false
	for i in Parser.allComponents.size():
		var currentEntry = Parser.allComponents[i]
		var entryClass = validityOfEntry.new()
		entryClass.initialice(currentEntry)
		
		if currentEntry.validInputs.size() > 0:  checkForValidOption(entryClass)
		else:                             checkForValidDataType(entryClass)
		
		
		if entryClass.isValid != true:
			isAlertless = true
			var sceneToLoad = load("res://Media/presets/alert.tres")
			entryClass.scene.inputMarker.add_stylebox_override("panel",sceneToLoad)
		else:
			var sceneToLoad = load("res://Media/presets/defualtEffectnput.tres")
			entryClass.scene.inputMarker.add_stylebox_override("panel",sceneToLoad)
	
	return isAlertless


func checkForValidOption(currentEntry):
	if currentEntry.optionInputs.size() > 0:  currentEntry.isValid = true
	else:                             currentEntry.isValid = false



func checkForValidDataType(currentEntry):
	match currentEntry.dataType:
		"STRING"  : checkForString(currentEntry)
		"BOOLEAN" : checkForBoolean(currentEntry)
		"INTEGER" : checkForInteger(currentEntry)





func checkForString(currentEntry):     
	if currentEntry.input != "": 
		currentEntry.isValid  = true

func checkForInteger(currentEntry):
	if currentEntry.input != "": 
		for i in 9999:
			if currentEntry.input ==str(i):
				currentEntry.isValid  = true

func checkForBoolean(currentEntry):
	if currentEntry.input != "": 
		currentEntry.isValid  = true


class validityOfEntry:
	var input
	var scene
	var dataType
	
	var isValid = false
	var style
	var optionInputs
	
	func initialice(currentEntry):
		scene           = currentEntry["scene"]
		
		dataType        = currentEntry["validType"]
		style           = currentEntry["style"]
		optionInputs    = currentEntry["validInputs"]
		
		if currentEntry["scene"].inputRTL is OptionButton: currentEntry["scene"].inputRTL.get_item_text(currentEntry["scene"].inputRTL.selected)
		else:input           = currentEntry["scene"].inputRTL.bbcode_text
