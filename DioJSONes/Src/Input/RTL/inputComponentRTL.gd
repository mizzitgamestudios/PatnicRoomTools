extends RichTextLabel
class_name InputRTL

onready var corespondingPanel:    Panel        = get_parent()

onready var defaultStyle:         StyleBoxFlat = load("res://Media/presets/IntegerInput.tres")  
onready var highlightStyle:       StyleBoxFlat = load("res://Media/presets/highlightedFormInput.tres")  

onready var inputMode:            bool         = false
onready var inputContent:         String       = ""
onready var isRegisteredInParser: bool         = false



func _input(event: InputEvent) -> void:
	if isTextFieldClicked(event):         
		inputMode = true
	
	if isTextInput(event):
		inputContent += event.as_text()
		bbcode_text   = inputContent
	
	
	if isMouseOnNode(corespondingPanel):  
		corespondingPanel.add_stylebox_override("panel",highlightStyle)
	
	if !isMouseOnNode(corespondingPanel): 
		inputMode = false
		corespondingPanel.add_stylebox_override("panel",defaultStyle)

		


func isTextInput(event):        return isMouseOnNode(corespondingPanel) and inputMode and event is InputEventKey and event.is_pressed()
func isTextFieldClicked(event): return isMouseOnNode(corespondingPanel) and event.is_action("leftClick")


func isMouseOnNode(node):
	var minVec          = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec          = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
	var mouse           = node.get_global_mouse_position()
	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y


