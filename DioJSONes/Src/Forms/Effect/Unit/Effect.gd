extends Control

var effectTypeButton:           BaseButton
var currentUnselectedOptionBox: EffectMorphBox

var effectMode
var listOfInputs = ["","","",""]

var numbersOfEffectsDisplayed = 1
var numberOfEffects           = 4
var listOfEffects             = []
 
func _ready() -> void:
	setUpNodeReferences()
	fillMorphBoxes()
	hideUnfilledSpecificTrigger()
	effectMode = ENUM.EFFECT_TYPE.UNSELECTED



func setUpNodeReferences():
	effectTypeButton = get_node("CheckButton")
	
	for i in numberOfEffects:
		var iToString = str(i)
		listOfEffects.append( get_node("Pairs/"+iToString+"/optionButton") )



func hideUnfilledSpecificTrigger():
	var toHide = numberOfEffects - numbersOfEffectsDisplayed
	
	for i in toHide:
		var offset = i
		var currentIndexNumber  = numbersOfEffectsDisplayed + offset
		
		if isOffsetInBounds(currentIndexNumber):
			var currentMorphbox     = listOfEffects[currentIndexNumber]
			currentMorphbox.visible = false



func isOffsetInBounds(offset): return offset < listOfEffects.size()



func fillMorphBoxes():
	for i in listOfEffects.size():
		var currentEffect = listOfEffects[i]
		currentEffect.fillAllAlt()


func on_cache_All_Data():
	for i in listOfEffects.size():
		var currentEffect = listOfEffects[i]
		
		var select = currentEffect.getSelectToString()
		listOfInputs[i] = SYNTAX.INPUT_TO_KEYWORD(select)
	Parser.allNodes["effect"] = listOfInputs

