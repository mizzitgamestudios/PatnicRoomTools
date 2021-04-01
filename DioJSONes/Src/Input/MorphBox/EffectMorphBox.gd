extends MorphBox
class_name EffectMorphBox


var typeButton:  BaseButton
var currentType: int

var listOfStatMods        = SYNTAX.GET_STAT_MOD_TO_STRING()
var listOfCondtiions      = SYNTAX.GET_CONDITION_TO_STRING()
var currentListOfElements = []


func _ready() -> void:
	typeButton  = get_node("../CheckButton")
	currentType = ENUM.EFFECT_TYPE.UNSELECTED


func fillAllAlt():
	if listOfCondtiions.size()==0: add_item("")
	add_item("----CONDITIONS----")
	parseForInsert(listOfCondtiions)
	
	if listOfCondtiions.size()==0: add_item("")
	add_item("----STAT MODS----")
	parseForInsert(listOfStatMods)


func getModuleToMorph(index):
	var selectedItem = self.get_selected_id()
	selectedItem = get_item_text(selectedItem)
	
#	if currentListOfElements.has(selectedItem):
#		for j in Syntax_Utils.EFFECT_MODULE_TYPES.size():
#
#			if Syntax_Utils.EFFECT_MODULE_TYPES[j].has(selectedItem):
#				return Syntax_Utils.MODULE_FILEPATH_BY_NR[j]
#


func setCurrentListOfEffectsByType():
	if   currentType == ENUM.EFFECT_TYPE.CONDITION:  currentListOfElements  = listOfCondtiions
	elif currentType == ENUM.EFFECT_TYPE.STAT_MOD:   currentListOfElements  = listOfStatMods
	elif currentType == ENUM.EFFECT_TYPE.UNSELECTED: currentListOfElements  = []



func _on_EffectSelected(index:int) -> void:
	setCurrentListOfEffectsByType()
	_on_ItemSelected(index)



func _on_button_pressed() -> void:
	setCurrentListOfEffectsByType()
	parseForInsert(currentListOfElements)




