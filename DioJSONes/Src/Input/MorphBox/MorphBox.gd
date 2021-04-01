extends OptionButton
class_name MorphBox

var inputNode
var itemsToModule = []



func _ready() -> void:
	connect("item_selected",self,"_on_ItemSelected")


func fillFormModuleBySelectNr():
	for i in items.size():
		var currentItem = items[i]
#
#		for j in Syntax_Utils.EFFECT_MODULE_TYPES.size():
#
#			if Syntax_Utils.EFFECT_MODULE_TYPES.has(currentItem):
#				itemsToModule.append(Syntax_Utils.MODULE_TYPE_BY_NR[j])



func getModuleToMorph(index:int):
	var selectedItem = get_item_text(index)
	
#	for j in Syntax_Utils.EFFECT_MODULE_TYPES.size():
#
#		if Syntax_Utils.EFFECT_MODULE_TYPES[j].has(selectedItem):
#			return Syntax_Utils.MODULE_FILEPATH_BY_NR[j]



func _on_ItemSelected(index:int) -> void:
	if  inputNode != null:  remove_child(inputNode)
	var filepath = getModuleToMorph(index)
	
	if filepath != null:
		inputNode = load(filepath).instance()
		add_child(inputNode)
	
	


func parseForInsert(list:Array):
	add_item("")
	for i in list.size():
		var currentEntry = list[i]
		add_item(str(currentEntry))


func getSelectToString():
	var selectedItem = self.get_selected_id()
	return get_item_text(selectedItem)



