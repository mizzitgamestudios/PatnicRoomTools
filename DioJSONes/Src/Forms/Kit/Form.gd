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
	Utils.printJSON(dict)




