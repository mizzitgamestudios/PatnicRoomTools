extends Panel

var value
func _input(event: InputEvent) -> void:
	
	value = get_node("slider").value
	get_node("counter").bbcode_text = str(value)
