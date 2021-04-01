extends Control


var basicTrigger          
var listOfSpecificTrigger     = []
var listOfInputs              = ["","","",""]
var numberOfSPecificTrigger   = 4
var NumberOfSpecificDisplayed = 1

func _ready() -> void:
	setUpNodeReferences()
	fillMorphBoxes()
	hideUnfilledSpecificTrigger()


func setUpNodeReferences():
	basicTrigger = get_node("Basic/OptionButton")
	
	for i in numberOfSPecificTrigger:
		var iToString = str(i)
		listOfSpecificTrigger.append( get_node("Pairs/"+iToString+"/optionButton") )



func fillMorphBoxes():
	basicTrigger.parseForInsert( SYNTAX.GET_TRIGGER_BASE_TO_STRING() )
	
	for i in listOfSpecificTrigger.size():
		var currentSpecificTrigger = listOfSpecificTrigger[i]
		currentSpecificTrigger.parseForInsert( SYNTAX.GET_TRIGGER_SPECIFIC_TO_STRING() )



func hideUnfilledSpecificTrigger():
	var toHide = numberOfSPecificTrigger - NumberOfSpecificDisplayed
	
	for i in toHide:
		var offset = i 
		var currentIndexNumber  = NumberOfSpecificDisplayed + offset
		
		if isOffsetInBounds(currentIndexNumber):
			var currentMorphbox     = listOfSpecificTrigger[currentIndexNumber]
			currentMorphbox.visible = false


#func _process(delta: float) -> void:
#	for i in listOfSpecificTrigger.size():
#		var currentInput = listOfSpecificTrigger[i].selected
#
#		if currentInput != 0:
#
#
#		else: listOfInputs[i] = ""



func isOffsetInBounds(offset): return offset < listOfSpecificTrigger.size()
func getCurrentNodes(nthOfList:String):      return { "option":get_Specific_Option(nthOfList)}

func get_Specific_Input(nthOfList:String):   return get_node("pairs/"+   nthOfList +"/Reach2")
func get_Specific_Option(nthOfList:String):  return get_node("Pairs/"+   nthOfList +"/optionButton")

func hidePair(mode:String,i:String):                get_node("Pairs/"+i).visible = false





func on_cache_All_Data():
	
	for i in listOfSpecificTrigger.size():
		var currentSpecific = listOfSpecificTrigger[i]
		
		var select = currentSpecific.getSelectToString()
		listOfInputs[i] = SYNTAX.INPUT_TO_KEYWORD(select)
	Parser.allNodes["triggerSpecific"]  = listOfInputs
	
	
	
