extends Control
 
onready var reach:  InputEffectRTL 
onready var medium: MorphBox 
onready var source: MorphBox 
onready var mType:  MorphBox

var listOfInputs = ["","","",""]
var listOfMorphBox

func _ready() -> void:
	setUpNodeReferences()
	fillMorphBoxes()



func setUpNodeReferences():
	reach          = get_node("Reach/Panel/input")
	medium         = get_node("Medium/OptionButton")
	source         = get_node("Source/OptionButton")
	mType          = get_node("M-Type/OptionButton")
	
	listOfMorphBox = [reach,medium,source,mType]



func fillMorphBoxes():
	source.parseForInsert( SYNTAX.GET_SOURCE_TO_STRING() )
	medium.parseForInsert( SYNTAX.GET_MEDIUM_TO_STRING() )
	mType.parseForInsert(  SYNTAX.GET_M_TYPE_TO_STRING() )



func on_cache_All_Data():
	var arr = [medium,source,mType]
	for i in arr.size():
		var select = arr[i].getSelectToString()
		listOfInputs[i] = SYNTAX.INPUT_TO_KEYWORD(select)
	
	Parser.allNodes["reach"]   = ""
	Parser.allNodes["medium"]  = listOfInputs[0]
	Parser.allNodes["source"]  = listOfInputs[3]
	Parser.allNodes["mType"]   = listOfInputs[2]



