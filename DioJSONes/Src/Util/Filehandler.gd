extends Node
class_name FileHandler



func fileToDictionary(filepath:String):
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result



func printForm(dict:Dictionary):
	var file = File.new()
	file.open("foobar.txt",File.WRITE)
	file.store_string(to_json(dict))
	file.close()
	print(dict)




