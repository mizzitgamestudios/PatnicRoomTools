extends Panel
class_name InputPanel



var hintRTL: RichTextLabel
var toolTip: String




func _input(event: InputEvent) -> void:
	if isMouseOnNode(self):
		hintRTL.bbcode_text = toolTip


func isMouseOnNode(node):
	var minVec          = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec          = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
	var mouse           = node.get_global_mouse_position()
	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y
