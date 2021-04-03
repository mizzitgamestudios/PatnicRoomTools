extends Node
class_name FormFiller

var formRoot:         Node2D
var hintRTIL:         RichTextLabel

var lastPosY:         int
var componentsToFill: Array


func _init(formRootPara,componentsToFillPara) -> void:
	formRoot           = formRootPara
	componentsToFill   = componentsToFillPara
	hintRTIL           = formRoot.get_node("debug/explain/RichTextLabel")



func fillForm():
	for i in componentsToFill.size():
		var currentComp      = componentsToFill[i]
		
		var currentFormFiel
		var entryInstance 
		var currentFormField
		
		if currentComp.has("validInputs") and currentComp["validInputs"].size() > 0:
			entryInstance = load("res://Src/Dynamic Form Generator/Form Box.tscn").instance()
			currentFormField = FormFieldAttributes.new(currentComp,i,entryInstance)
			formRoot.add_child(entryInstance)
			entryInstance.initialice(currentFormField, hintRTIL,currentComp["validInputs"])
		
		
		else:
			entryInstance = load("res://Src/Dynamic Form Generator/RowText.tscn").instance()
			currentFormField = FormFieldAttributes.new(currentComp,i,entryInstance)
			formRoot.add_child(entryInstance)
			entryInstance.initialice(currentFormField, hintRTIL)
		
		
		lastPosY               = currentFormField.pos.y
		currentFormField.input = entryInstance.get_node("inputPanel/inputRTL")
		Parser.allComponents.append(currentFormField)


func setGUI():
	var posOfWrapper = Vector2(1730,lastPosY+70)
	formRoot.get_node("gui/overhead").set_size(posOfWrapper)
	
	var posXForCollumn   = [400,550,700]
	for i in posXForCollumn.size():
		
		var posToDraw    = Vector2(posXForCollumn[i],lastPosY+40)
		var collumn      = formRoot.get_node( "gui/collumn"+str(i) )
		
		collumn.set_size(posToDraw)
