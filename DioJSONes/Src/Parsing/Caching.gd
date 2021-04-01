extends Node




func fetchDataOfEffect(currentSlot):
	currentSlot.scene.get_node("Space").on_cache_All_Data()
	currentSlot.scene.get_node("Trigger").on_cache_All_Data()
	currentSlot.scene.get_node("Effect").on_cache_All_Data()



func cacheEffect(currentSlot,timeslots):
	fetchDataOfEffect(currentSlot)
	
	parseByNodes(currentSlot)
	
	timeslots.remove_child(currentSlot.scene)
	return currentSlot.effectCache



func parseByNodes(currentSlot):
	for i in Parser.allNodes.size():
	
		var currentValue    = Parser.allNodes.values()[i]
		var currentKeyword  = Parser.allNodes.keys()[i]
	
		cacheEntry(currentValue,currentKeyword,currentSlot)





func cacheEntry(currentValue,currentKeyword,currentSlot):
	var cache = currentSlot.effectCache
	match currentKeyword:
		"reach"              : cache.spaceReach     =  int(currentValue)
		"medium"             : cache.spaceMedium    =  SYNTAX.GET_MEDIUM()[int(currentValue)]
		"source"             : cache.spaceSource    =  SYNTAX.GET_SOURCE()[int(currentValue)]
		"mType"              : cache.spaceMType     =  SYNTAX.GET_M_TYPE()[int(currentValue)]
		
		"triggerBasic"       : cache.triggerBase    =  SYNTAX.GET_TRIGGER_BASE()[int(currentValue)]
		"triggerSpecific"    :                         manageSpecificTrigger(currentValue,currentKeyword,cache)
		
		"effect"             :                         manageEffects(currentKeyword,currentValue,cache)



func manageEffects(currentKeyword,currentValue,cache):
	var conditions = SYNTAX.GET_STAT_MOD()
	var statMod    = SYNTAX.GET_CONDITION()
	
	if   statMod.has(currentKeyword):    cache.effectStatmod.append([currentKeyword,currentValue])
	elif conditions.has(currentKeyword): cache.effectCondition.append([currentKeyword,currentValue])


func manageSpecificTrigger(currentValue,currentKeyword,cache):
	var arrForCache = []
	for i in currentValue.size():
		var currentEntry = currentValue[i]
		
		
		if str(currentEntry[1]) == " " and currentEntry[0] == 0: arrForCache.append(["BASE","BASE"])
		
		else:
			var keyword = SYNTAX.GET_TRIGGER_SPECIFIC()[currentEntry[0]]
			arrForCache.append([keyword,currentEntry[1]])
	
	cache.triggerSpecific = arrForCache







func isCacheValid(cache):
	var boolToReturn = true
	
	if isInvalid(SYNTAX.GET_MEDIUM(),           cache.spaceMedium):     boolToReturn = false
	if !SYNTAX.GET_M_TYPE().has(cache.spaceMType):                                  boolToReturn = false
	if isInvalid(SYNTAX.GET_SOURCE(),           cache.spaceSource):     boolToReturn = false
	
	if isInvalid(Syntax_Effect.EFFECT_TRIGGER_BASIC,          cache.triggerBase):     boolToReturn = false
	if isNestedInvalid(SYNTAX.GET_TRIGGER_SPECIFIC(), cache.triggerSpecific): boolToReturn = false
	
	if isNestedInvalid(SYNTAX.GET_STAT_MOD(),   cache.effectStatmod):   boolToReturn = false
	if isNestedInvalid(Syntax_Effect.EFFECT_UNIQUE_CONDITION, cache.effectCondition): boolToReturn = false
	
	return boolToReturn 


func isInvalid(syntaxKeyword,entry):
	return !syntaxKeyword.keys().has(entry) 


func isNestedInvalid(specificTrigger,cachedTrigger):
	for i in cachedTrigger.size():
		var currentEntry = cachedTrigger[i]
		
		return !specificTrigger.keys().has(currentEntry[0])







