extends Node

var saveInStable

static func autorefresh():
	var dict = Utils.fileToDictionary("Bootstrap.json")
	
	var autoRefresh    = dict["boot with auto-refresh"]
	var filepathToRoot = dict["filepath to the P@nicRoom Rootfolder"]
	
	if autoRefresh:
		var absolutePath #= filepathToRoot+"GameDoc\Components.json"
		dict = Utils.fileToDictionary(absolutePath)

static func getFilepathToSave(nameOfKit):
	var boot = Utils.fileToDictionary("Bootstrap.json")
	
	
	var saveInStable   = boot["save JSON in stable folder of Root"]
	
	if saveInStable: return boot["filepath to the P@nicRoom Rootfolder"]+"GameData/Custome"+nameOfKit+".json"
	else:            return "foobar.json"




