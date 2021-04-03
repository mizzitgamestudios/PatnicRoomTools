extends Node2D


func _ready() -> void:
	var dict                   = Utils.fileToDictionary("res://Bootstrap.json")
	Utils.filePathToPatnicroom = dict["filepath to the P@nicRoom Rootfolder"]



# MAIN MENUE POINTS #
func loadBaseKit()        -> void:  loadForm( Utils.getBaseKitsFormComp(),     "res://Src/Forms/Kit/Form.tscn"    )
func loadModKit()         -> void:  loadForm( Utils.getModKitsFormComp(),      "res://Src/Forms/Kit/Form.tscn"    )
func loadAppendixKit()    -> void:  loadForm( Utils.getAppendixKitsFormComp(), "res://Src/Forms/Kit/Form.tscn"    )


func loadRoleActor()      -> void:  loadForm( Utils.getRoleActorFormComp(),    "res://Src/Forms/Actors/Form.tscn" )
func loadRaceActor()      -> void:  loadForm( Utils.getRaceActorsFormComp(),   "res://Src/Forms/Actors/Form.tscn" )
func loadSpecialtyActor() -> void:  loadForm( Utils.getSpecialtyActorComp(),   "res://Src/Forms/Actors/Form.tscn" )


func loadItems()          -> void:  get_tree().change_scene("res://Src/Forms/Gear/Items/Form.tscn")


func loadForm(arrOfComps,filepath):
	Utils.componentsToLoad = arrOfComps
	get_tree().change_scene(filepath)



