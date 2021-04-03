extends Parent_Form


var timeslots   
var currentSlot


func _ready() -> void:
	var effectForm = load("res://Src/Forms/Effect/Form.tscn").instance()
	.add_child(effectForm)
	
	timeslots = get_node("Effect/timeslots")
	


func openByArrayNr(nr:int):
	if is_instance_valid(currentSlot): Caching.cacheEffect(currentSlot,timeslots)
	currentSlot = timeslots.wholeEffectParse[nr]
	timeslots.add_child(currentSlot.scene)



func checkAndSaveForm() -> void:
	Parser.cachedEffectSet = []
	
	for i in 4:
		openByArrayNr(i)
		var currentTimeSlot = timeslots.wholeEffectParse[i]
		Parser.cachedEffectSet.append( Caching.cacheEffect(currentTimeSlot,timeslots) )
	
	var dict = Parser.buildGameElement()
	appendFlag(dict)
	Utils.printJSON(dict)



func appendFlag(dict):
	dict["C_40_ANY_TO_STRING"] = dict["C_6_TILE_NAME"]
	dict["F_5_KITPART_TYPE"] = "N/A"
	return dict



