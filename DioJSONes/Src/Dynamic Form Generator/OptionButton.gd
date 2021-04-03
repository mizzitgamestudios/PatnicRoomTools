extends OptionButton






func initialice(validInputs:Array):
	add_item("")
	for i in validInputs.size():
		add_item(validInputs[i])

