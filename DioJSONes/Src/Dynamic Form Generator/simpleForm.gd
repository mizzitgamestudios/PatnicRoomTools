extends Node
class_name Parent_Form

func _ready() -> void:
	var formBuilder = FormFiller.new(self,Utils.componentsToLoad)
	formBuilder.fillForm()
	formBuilder.setGUI()




func backToMainMenue() -> void:
	get_tree().change_scene("res://Src/Main.tscn")

