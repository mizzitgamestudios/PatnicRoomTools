extends Control


var wholeEffectParse = []

func _ready() -> void:
	for i in 4:
		var currentButton = get_node(str(i)+"/CheckButton")
		
		var currentSlot   = SlotMeta.new()
		currentSlot.initialice(currentButton)
		
		wholeEffectParse.append(currentSlot)
		



class SlotMeta:
	var effectCache  : EffectCache
	var scene        : Node2D
	
	func initialice(buttonPara: CheckButton) -> void:
		effectCache = EffectCache.new()
		scene       = load("res://Src/Forms/Effect/Slot/Slot.tscn").instance()




func openSpawn():    get_tree().current_scene.openByArrayNr(0)
func openOnset():    get_tree().current_scene.openByArrayNr(1)
func openEffect():   get_tree().current_scene.openByArrayNr(2)
func openOffset():   get_tree().current_scene.openByArrayNr(3)
