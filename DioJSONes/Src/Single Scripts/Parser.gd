extends Node

var allComponents = []
var allNodes = {}
var cachedEffect = [] 
var cachedEffectSet = []



func buildGameElement():
	var dict = {}
	
	for i in allComponents.size():
		var curentEntry = allComponents[i]
		var input = curentEntry.scene.get_node("inputPanel/input")
		
		if input is RichTextLabel: input = input.bbcode_text
		if input is OptionButton: input  = input.get_item_text(input.get_selected_id())
		dict[curentEntry.componentName]  = input
	
	
	dict["C_49_EFFECT_REFERENCE"] = cachedEffectToDict() 
	
	dict = organiceEffect(dict)
	dict = organiceGenerall(dict)
	return dict




func cachedEffectToDict(): 
	var timeArr    = [ "TIME-0"    , "TIME-1"    , "TIME-2"    , "TIME-3"    ]
	var triggerArr = [ "TRIGGER-0" , "TRIGGER-1" , "TRIGGER-2" , "TRIGGER-3" ]
	var spaceArr   = [ "SPACE-0"   , "SPACE-1"   , "SPACE-2"   , "SPACE-3"   ]
	var effectArr  = [ "EFFECT-0"  , "EFFECT-1"  , "EFFECT-2"  , "EFFECT-3"  ]
	
	var dictSum    = []
	
	for i in 4:
		var currenteffect = Parser.cachedEffectSet[i]
		var dict = {}
		
		dict["TIME-"+str(i)] =  1
		
		dict["SPACE-"+str(i)] = { "MEDIUM":currenteffect.spaceMedium , "SOURCE":currenteffect.spaceSource , "REACH":currenteffect.spaceReach , "M_TYPE":currenteffect.spaceMType }
		
		dict["TRIGGER-"+str(i)] = { "BASE"  :currenteffect.triggerBase     , "SPECIFIC" :  currenteffect.triggerSpecific  } 
		dict["EFFECT-"+str(i) ] = { "CONDITION"  :currenteffect.effectCondition , "STAT_MOD" : [ currenteffect.effectStatmod   ] } 
		
		dictSum.append(dict)
	
	
	return dictSum



func organiceEffect(dictSum):
	var unitsToParse = ["TIME","SPACE","TRIGGER","EFFECT"]
	var dictToReturn = {}
	
	var entry = {}
	var slot
	
	
	for i in unitsToParse.size():
		slot  = unitsToParse[i]
		for j in 4:
			
			var unitToString = unitsToParse[i]+"-"+str(j)
			entry[unitToString] = dictSum["C_49_EFFECT_REFERENCE"][j][unitToString]
		
		dictToReturn[slot] = entry
		entry = {}
	
	dictSum["C_49_EFFECT_REFERENCE"] = dictToReturn
	
	return dictSum


func organiceGenerall(dict):
	dict["C_40_ANY_TO_STRING"] = dict["C_6_TILE_NAME"]
	dict["C_37_M_TYPE"]        = dict["C_49_EFFECT_REFERENCE"]["SPACE"]["SPACE-0"]["M_TYPE"]
	return dict



 
