extends Node2D

onready var nameRTL        : RichTextLabel = get_node("nameRTL")
onready var typeRTL        : RichTextLabel = get_node("typeRTL")
onready var descriptionRTL : RichTextLabel = get_node("descriptionRTL")

onready var inputMarker    : Panel         = get_node("inputPanel")
onready var inputRTL        = inputMarker.get_node("inputRTL")


func initialice(field:FormFieldAttributes,hintRTLPara:RichTextLabel,item:Array=[]):
	drawSeperator(field)
	
	setUpRTLRows(field)
	inputRTL = get_node("inputPanel/input")
	markInputField(field,hintRTLPara) 
	
	if item.size()>0:   get_node("inputPanel/input").initialice(item)



func drawSeperator(field):
	var pos = Vector2(0,field.pos.y+10)
	get_node("separator").set_position(pos)




func setUpRTLRows(field):
	var posY                 = field.pos.y
	
	var row                  = [ nameRTL           ,  typeRTL                ,  descriptionRTL     ]
	var rowContent           = [ field.nameToShow  ,  field.dataTypeToString ,  field.description  ]
	var rowPos               = [ Vector2(008,posY) ,  Vector2(0250,posY)     ,  Vector2(1000,posY) ]
	
	for i in row.size():
		row[i].bbcode_text   = rowContent[i]
		row[i].rect_position = rowPos[i]



func markInputField(field,hintRTLPara):
	inputMarker.hintRTL       = hintRTLPara
	inputMarker.toolTip       = field.suggestion
	
	inputMarker.rect_position = field.pos
	inputMarker.rect_size     = field.size
	
	inputMarker.add_stylebox_override("panel",field.style)





