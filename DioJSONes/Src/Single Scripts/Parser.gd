extends Node

var allComponents = []
var allNodes = {}
var cachedEffect = [] 
var cachedEffectSet = []



func buildGameElement():
	var dict = {}
	
	for i in allComponents.size():
		dict[allComponents[i].componentName] = allComponents[i].input.inputContent
	
	dict["C_49_EFFECT_REFERENCE"] = cachedEffectToDict()
	
	return dict



func buildComponentDict():
	var test = Parser.allComponents




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
		dict["EFFECT-"+str(i) ] = { "BASE"  :currenteffect.effectCondition , "STAT_MOD" : [ currenteffect.effectStatmod   ] } 
		
		dictSum.append(dict)
		
	return organiceDict(dictSum)



func organiceDict(dictSum):
	var unitsToParse = ["TIME","SPACE","TRIGGER","EFFECT"]
	var dict = {}
		
	for j in unitsToParse.size():
		var unit = {}
		for i in 4:
			
			var unitToKey   = unitsToParse[j]+"-"+str(i)
			
			var cache       = dictSum[i][unitToKey]
			unit[unitToKey] = cache
			
		dict[unitsToParse[j]] = unit
		
	return dict






