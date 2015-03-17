private-event-handling
textMorphKeyStroke: aKeyboardEvent

	aKeyboardEvent keyValue = Character escape asciiValue ifTrue: [
		self emit: #escapeKeyPressed.
	].

	aKeyboardEvent keyValue = Character cr asciiValue ifTrue: [
		self emit: #enterKeyPressed.
	].

	((aKeyboardEvent keyValue = Character arrowDown asciiValue)
	or: [aKeyboardEvent keyValue = Character arrowUp asciiValue]
	or: [aKeyboardEvent keyValue = Character arrowLeft asciiValue]
	or: [aKeyboardEvent keyValue = Character arrowRight asciiValue]) ifTrue: [
		self emit: #arrowKeyPressed withArgs: { Character value: aKeyboardEvent keyValue }.
	].